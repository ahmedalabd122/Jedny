import 'package:flutter/material.dart';

Color primaryColor = Color(0xff3030D0);
Color secondaryColor = Color(0xff1BD483);

ThemeData mainTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: Color(0xff3030D0),
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
