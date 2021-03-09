import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:ikinokat/config/custom_theme.dart';
import 'package:ikinokat/pages/main/provider/main_provider.dart';
import 'package:ikinokat/pages/profile/provider/theme_provider.dart';
import 'package:ikinokat/translations/binding.dart';
import 'package:provider/provider.dart';
import 'pages/main/main_page.dart';
import 'translations/app_translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeNotifier(lightTheme),
        ),
      ],
      child: IKINOKATAPP(),
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
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return GetMaterialApp(
      translationsKeys: AppTranslation.translationKeys,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('ru', 'RU'),
      title: "Iki Nokat Application",
      defaultTransition: Transition.fade,
      debugShowCheckedModeBanner: false,
      initialBinding: LanguageBinding(),
      theme: themeNotifier.getTheme,
      home: MainPage(),
    );
  }
}
