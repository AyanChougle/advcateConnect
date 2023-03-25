import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.black),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Image(
              height: 190,
              width: 150,
              image: AssetImage('assets/images/lr_2.jfif'),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                'Name: Tony Stark age: 45 Place: Mumbai' ,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
