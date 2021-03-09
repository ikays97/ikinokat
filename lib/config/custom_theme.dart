import 'package:flutter/material.dart';
import 'package:ikinokat/pages/main/provider/theme_provider.dart';

CustomTheme currentTheme = CustomTheme();

class CustomColors {
  static const Color grey = Color(0xFF848484);
  static const Color darkGrey = Color(0xFF222222);
  static const Color black = Color(0xFF141414);
  static const Color unselectedItemColor = Color(0xff999999);
  static const Color selectedItemColor = Color(0xFF703737);
  static const Color backgroundColor = Color(0xfffefefe);
  static const Color dividerColor = Color(0xffdfdfdf);
  static const Color appBarColor = Color(0xFFA70B0B);
}

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);
