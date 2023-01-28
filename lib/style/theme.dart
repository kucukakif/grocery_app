import 'package:flutter/material.dart';
import 'package:grocery_app/style/colors.dart';

String gilroyFontFamily = "Gilroy";

ThemeData themeData = ThemeData(
  fontFamily: gilroyFontFamily,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
);

EdgeInsetsGeometry padding20h = const EdgeInsets.symmetric(horizontal: 20);

TextStyle f20w9 = const TextStyle(
    color: Colors.black, fontSize: 23, fontWeight: FontWeight.w900);

TextStyle f25w9 = const TextStyle(
    color: Colors.black, fontSize: 25, fontWeight: FontWeight.w900);

TextStyle style1 =
    const TextStyle(color: AppColors.darkGrey, fontWeight: FontWeight.w500);
TextStyle style2 = const TextStyle(fontWeight: FontWeight.w800, fontSize: 16);
TextStyle style3 = const TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
