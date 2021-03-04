import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    EasyLocalization(
      path: 'assets/locales',
      supportedLocales: [
        Locale('en', 'UK'),
        Locale('ru', 'RU'),
        Locale('tk', 'TM')
      ],
      child: IKINOKATAPP(),
    ),
  );
}

class IKINOKATAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
