import 'package:flutter/material.dart';
import 'package:modernlogintute/components/app_style.dart';
import 'package:modernlogintute/pages/add_money.dart';

import 'Booking.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

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
                        'Wallet',
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
                    'Balance in your wallet : ',
                    style: styles.headLineStyle2.copyWith(fontSize: 26),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Center(
                    child: Text(
                      '     ₹ 800',
                      style: styles.headLineStyle2.copyWith(fontSize: 70),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 400,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddMoney(),
                    ),
                  );
                },
                child: const Text(
                  'ADD MONEY',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
