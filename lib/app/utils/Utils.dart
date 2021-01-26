import 'package:flutter/cupertino.dart';

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

List<BoxShadow> customDarkShadow = [
  BoxShadow(
      color: hexToColor("#000000"), offset: Offset(0.0, 3.0), blurRadius: 8.0)
];



LinearGradient linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      hexToColor("#6ae7a7"),
      hexToColor("#15bf9e"),
    ]);
