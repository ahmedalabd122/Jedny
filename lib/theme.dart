import 'package:flutter/material.dart';

Color primaryColor = const Color(0xff3030D0);
Color secondaryColor = const Color(0xff1BD483);

ThemeData mainTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  primaryColor: primaryColor,
  fontFamily: 'NotoKufiArabic',
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 10.0),
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          backgroundColor: MaterialStateProperty.all<Color>(secondaryColor))),
);
