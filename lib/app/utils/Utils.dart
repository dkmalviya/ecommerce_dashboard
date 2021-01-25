import 'package:flutter/cupertino.dart';

Color hexToColor(String code){
  return new Color(int.parse(code.substring(1,7),radix: 16)+0xFF000000);
}

List<BoxShadow> customDarkShadow=[
  BoxShadow(
    color: hexToColor("#000000"),
    offset: Offset(0.0,3.0),
    blurRadius: 8.0
  )
];