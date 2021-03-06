import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ikinokat/pages/main/provider/main_provider.dart';
import 'package:provider/provider.dart';
import 'pages/main/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/locales',
      fallbackLocale: Locale('en', 'US'),
      supportedLocales: [
        Locale('en', 'UK'),
        Locale('ru', 'RU'),
        Locale('en', 'US'),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => MainProvider(),
          ),
        ],
        child: IKINOKATAPP(),
      ),
    ),
  );
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class IKINOKATAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Iki Nokat',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: MainPage(),
    );
  }
}
