import 'package:flutter/material.dart';

class CColors {
  static Color buttonOne = Color(0xFFD1AA57);
  static Color buttonTwo = Color(0xFFE1C17D);
  static Color buttonThree = Color(0xFFD1AA57);
  static Color textColor = Color(0xFF606060);
  static Color green = Color(0xFF03D84B);

// static Map<int, Color> getSwatch(Color color) {
//   final hslColor = HSLColor.fromColor(color);
//   final lightness = hslColor.lightness;
//   const lowDivisor = 6;
//   const highDivisor = 5;
//   final lowStep = (1.0 - lightness) / lowDivisor;
//   final highStep = lightness / highDivisor;
//   return {
//     50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
//     100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
//     200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
//     300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
//     400: (hslColor.withLightness(lightness + lowStep)).toColor(),
//     500: (hslColor.withLightness(lightness)).toColor(),
//     600: (hslColor.withLightness(lightness - highStep)).toColor(),
//     700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
//     800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
//     900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
//   };
// }
}
