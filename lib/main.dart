import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:ikinokat/config/custom_theme.dart';
import 'package:ikinokat/pages/main/provider/main_provider.dart';
import 'package:ikinokat/pages/profile/provider/theme_provider.dart';
import 'package:ikinokat/pages/profile/provider/user_provider.dart';
import 'package:ikinokat/translations/binding.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/main/main_page.dart';
import 'translations/app_translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then(
    (prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? true;
      var selectedLang = prefs.getString('language') ?? 'ru';
      var isLogin = prefs.getString('token') == null ? false : true;
      UserProvider userProvider = UserProvider(user: isLogin);
      print('baslangyc: ');
      print(userProvider.getUser);
      return runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<UserProvider>.value(value: userProvider),
            ChangeNotifierProvider(
              create: (_) => MainProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
            ),
          ],
          child: IKINOKATAPP(lang: selectedLang),
        ),
      );
    },
  );

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class IKINOKATAPP extends StatelessWidget {
  final String lang;

  const IKINOKATAPP({Key key, this.lang}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return GetMaterialApp(
      translationsKeys: AppTranslation.translationKeys,
      locale:
          lang == null ? Get.deviceLocale : Locale(lang, lang.toUpperCase()),
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
