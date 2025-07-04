import 'package:flutter/material.dart';

const Color kcPrimaryColor = Color(0xFF0D3F5B);
const Color kcPrimaryColorDark = Color(0xFF17020B);
const Color kcBlueColor = Color(0xFF10A8FE);
const Color kcRedColorDark = Color(0xFFFE1010);
const Color kcOrangeColor = Color(0xFFFE8210);
const Color kcGreyColor = Color(0xFF6A6A6A);
const Color kcPurpleColor = Color(0xFFDD10FE);
const Color kcDarkGreyColor = Color(0xFF1A1B1E);
const Color kcMediumGrey = Color(0xFF474A54);
const Color kcLightGrey = Color.fromARGB(255, 187, 187, 187);
const Color kcVeryLightGrey = Color(0xFFE3E3E3);
const Color kcBackgroundColor = Color(0xFFF7F7F7);
const Color kcInputFillColors = Color(0xFF92A8B4);
const Color kcIconBottomColors = Color(0xFF404040);
const Color kcTextGreyColor = Color(0xFF202020);
const Color kcGreenColor = Color(0xFF31AB67);
const Color kcAppbarIconColor = Color(0xFF262525);
LinearGradient linearcolor = const LinearGradient(colors: [
  Color(0xFF69023A),
  Color(0xFFC81577),
  Color(0xFFF82398),
]);

LinearGradient linearcolor3 = const LinearGradient(colors: [
  Color(0xFFF82398),
  Color(0xFFC81577),
  Color(0xFFA9005D),
]);

String colorToHexRGB(Color color) {
  return '#${color.red.toRadixString(16).padLeft(2, '0').toUpperCase()}'
         '${color.green.toRadixString(16).padLeft(2, '0').toUpperCase()}'
         '${color.blue.toRadixString(16).padLeft(2, '0').toUpperCase()}';
}