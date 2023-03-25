import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:modernlogintute/components/app_style.dart';

class AddMoney extends StatelessWidget {
  const AddMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styles.bgcolor,
      body: SingleChildScrollView(
        child: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Add Money'),
        ),
      ),
    );
  }
}
