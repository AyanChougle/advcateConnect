import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modernlogintute/components/app_style.dart';
import 'package:modernlogintute/data_models/advocate_data.dart';
import 'package:modernlogintute/pages/booking.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<AdvocateData> advocateList = [
    AdvocateData(
      id: 1,
      name: 'TONY STARK',
      description: 'I am the best of ',
      price: '4000/-',
      exp: '28 Y 10 M',
      type: 'Business Lawyer',
      imageUrl: "assets/images/lr_2.jfif",
    ),
    AdvocateData(
      id: 2,
      name: 'Natasha roman',
      description: 'I am the best of ',
      price: '4000/-',
      exp: '18 Y 1 M',
      type: 'Constitutional Lawyer',
      imageUrl: 'assets/images/lr_1.png',
    ),
    AdvocateData(
      id: 3,
      name: 'Thor Odinson',
      description: 'I am the best of ',
      price: '4000/-',
      exp: '25 Y 9 M',
      type: 'Criminal Defense Lawyer',
      imageUrl: 'assets/images/lr_3.jpg',
    ),
    AdvocateData(
      id: 4,
      name: 'Peter Parker',
      description: 'I am the best of ',
      price: '4000/-',
      exp: '10 Y 8 M',
      type: 'Estate Planning Lawyer',
      imageUrl: 'assets/images/lr_4.jpg',
    ),
    AdvocateData(
      id: 5,
      name: 'Steve Rogers',
      description: 'I am the best of ',
      price: '4000/-',
      exp: '10 Y 8 M',
      type: 'Family Lawyer',
      imageUrl: 'assets/images/lr_5.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styles.bgcolor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Book Appointment',
                        style: styles.headLineStyle,
                      ),
                    ],
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 0.6,
                color: Colors.grey[400],
              ),
              Row(
                children: [
                  Text(
                    'What are\n you looking for ?',
                    style: styles.headLineStyle2.copyWith(fontSize: 25),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  labelText: "Search ",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Text(
                    'Suggested Lawyers : ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              ListView.builder(
                itemCount: advocateList.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          child: Image.asset(
                            advocateList[index].imageUrl,
                            fit: BoxFit.cover,
                            height: 250,
                            width: 170,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  advocateList[index].name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  advocateList[index].description,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  advocateList[index].type,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  advocateList[index].exp,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  advocateList[index].price,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                RatingBar.builder(
                                  ignoreGestures: true,
                                  unratedColor: Colors.white,
                                  itemSize: 18,
                                  initialRating: 4,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.blue,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Booking(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Book Appointment',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
