import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/map.dart';
import 'package:modernlogintute/pages/profile.dart';
import 'package:modernlogintute/pages/search_page.dart';
import 'package:modernlogintute/pages/Booking.dart';
import 'package:modernlogintute/pages/wallet.dart';

class BottomBar extends StatefulWidget {
  // final Function(int currentValue)? onSelectionChanged;
  // const BottomBar({super.key, this.onSelectionChanged});

  //final user = FirebaseAuth.instance.currentUser!;

  const BottomBar({super.key});

  // // sign user out method
  // void signUserOut() {
  //   FirebaseAuth.instance.signOut();
  // }

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  //bottom navigation function
  int _selectedIndex = 0;
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  // void signUserOut() {
  //   FirebaseAuth.instance.signOut();
  // }

  final List<Widget> _widgetOptions = <Widget>[
    const SearchPage(),
    MapScreen(),
    const Wallet(),
    Profile(),
  ];

// bottom icon functions

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: IconButton(
      //   onPressed: signUserOut,
      //   icon: const Icon(
      //     Icons.logout,
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        elevation: 10,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black26,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "map",
            activeIcon: Icon(Icons.map),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: "Wallet",
            activeIcon: Icon(Icons.wallet),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: _widgetOptions[_selectedIndex],
        ),
      ),
    );
  }
}
