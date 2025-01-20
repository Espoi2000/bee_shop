// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color.fromARGB(255, 2, 2, 2);
  static const Color whiteColors = Colors.white;

  static const Color primaryColors = Color.fromRGBO(126, 23, 187, 1);
  static const Color secondayColor = Color.fromARGB(192, 222, 170, 252);
  //Color.fromRGBO(58, 133, 252, 1);
  static const Color secondaryTextAndBorderColors =
      Color.fromRGBO(113, 112, 121, 1);
  static const Color shadow = Color.fromRGBO(0, 0, 0, 0.16); //285bd4
  static const Color baseColors = Color.fromARGB(32, 113, 112, 121);
  static const higtlyColors = Color.fromARGB(86, 50, 56, 65);

  static const Color grayScale = Color(0xFF9099A6);
  static const Color primaryGrayText = Color.fromRGBO(51, 51, 51, 1);

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  static hexToColor(String hexString) {
    var hexColor = hexString.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
