import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  MapScreen({super.key});
  @override
  _MapScreenState createState() => _MapScreenState();

  final CameraPosition _currentLocation = const CameraPosition(
    target: LatLng(
      19.055096789739395,
      -122.085749655962,
    ),
    zoom: 15,
  );
}

GoogleMapController? _controller;
bool _invokedLocationService = false;
bool _invokedLocationPermission = false;
final markers = <MarkerId, Marker>{};

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this as WidgetsBindingObserver);
    _determinePermission();
    //_customMarker();
  }

  Future<void> _determinePermission() async {
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        showDialogForLocationService(context);
        return;
      }
    } else {
      _askPermission();
    }
  }

  _askPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        if (!kIsWeb) {
          showDialogForLocationPermission(context);
        }
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      showDialogForLocationPermission(context);
      return;
    }
  }

  _validateLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if ((permission == LocationPermission.whileInUse ||
            permission == LocationPermission.always ||
            permission == LocationPermission.unableToDetermine) &&
        _controller != null) {
      Position position = await Geolocator.getCurrentPosition();

      _controller!.animateCamera(CameraUpdate.newCameraPosition(
          const CameraPosition(
              target: LatLng(19.055096789739395, -122.085749655962))));
    }
  }

  showDialogForLocationPermission(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Location Permission Required to Function'),
        content: const Text('Turn on Location permission'),
        actions: [
          ElevatedButton(
            // textColor: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
              // Container();
              showDialogForLocationPermission(context);
              return;
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            // textColor: Colors.black,
            onPressed: () async {
              Navigator.of(context).pop();
              _invokedLocationPermission = true;
              await Geolocator.openAppSettings();
            },
            child: const Text('Allow now'),
          )
        ],
      ),
    );
  }

  showDialogForLocationService(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Location Services'),
        content: const Text('Allow Way2Masjid to Enable Location'),
        actions: [
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();
              _invokedLocationService = true;
              await Geolocator.openLocationSettings();
            },
            child: const Text('Go to Location Settings'),
          ),
        ],
      ),
    );
  }
  // Position position = await Geolocator.getCurrentPosition();
  // GeoFirePoint point =
  //     geo.point(latitude: position.latitude, longitude: position.longitude);

  @override
  Widget _buildGoogleMap(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        markers: Set<Marker>.of(markers.values),
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
            target: LatLng(19.055096789739395, -122.085749655962)),
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
          _validateLocation();
        },
      ),
    );
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (_invokedLocationService) {
        if (await Geolocator.isLocationServiceEnabled()) {
          _askPermission();
        }
        _invokedLocationService = false;
      } else if (_invokedLocationPermission) {
        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.whileInUse ||
            permission == LocationPermission.always) {
          _validateLocation();
        }
        _invokedLocationPermission = false;
      }
    }
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController? controller = _controller;
    controller?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, long),
          zoom: 20,
          tilt: 50.0,
          bearing: 45,
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _buildGoogleMap(context),
          ],
        ),
      ),
    );
  }
}
