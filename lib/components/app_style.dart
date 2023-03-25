import 'package:flutter/material.dart';

Color primary = const Color(0xFF687daf);

class styles {
  static Color primaryColor = primary;
  static Color textColor = Colors.black;
  static Color bgcolor = Colors.grey.shade300;
  static Color blue = Colors.blue;
  static TextStyle textStyle =
      TextStyle(fontSize: 16, color: textColor, fontWeight: FontWeight.w500);
  static TextStyle headLineStyle =
      TextStyle(fontSize: 26, color: textColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle2 =
      TextStyle(fontSize: 21, color: textColor, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle3 = TextStyle(
      fontSize: 17, color: Colors.grey.shade500, fontWeight: FontWeight.w500);
  static TextStyle headLineStyle4 = TextStyle(
      fontSize: 14, color: Colors.grey.shade500, fontWeight: FontWeight.w500);

  styles(Type fontStyle);
}
