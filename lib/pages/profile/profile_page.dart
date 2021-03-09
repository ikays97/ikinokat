import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ikinokat/config/custom_theme.dart';
import 'package:ikinokat/models/language.dart';
import 'package:ikinokat/services/language_controller.dart';
import 'package:ikinokat/utils/navigator.dart';
import 'package:ikinokat/widgets/my_appbar.dart';
import 'package:provider/provider.dart';
import 'provider/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        leadingType: AppBarBackType.None,
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SettingsPageContainer(),
    );
  }
}

class SettingsPageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          GestureDetector(
            onTap: () {
              MyNavigator.push(LanguageSelectPage());
            },
            child: Card(
              child: ListTile(
                leading: Icon(Icons.language_outlined),
                title: Row(
                  children: [
                    Text('language'.tr),
                    Spacer(),
                    Text("${Get.locale.languageCode}"),
                  ],
                ),
                trailing: Icon(Icons.arrow_right),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.wb_sunny_outlined),
              title: Row(
                children: [
                  Text('dark mode'),
                  Spacer(),
                  CupertinoSwitch(
                    value: themeNotifier.getTheme == darkTheme,
                    onChanged: (value) async {
                      (value)
                          ? themeNotifier.setTheme(darkTheme)
                          : themeNotifier.setTheme(lightTheme);
                      // var prefs = await SharedPreferences.getInstance();
                      // prefs.setBool('darkMode', value);
                    },
                  ),
                ],
              ),
            ),
          ),
          // RaisedButton(
          //   onPressed: () => Get.toNamed("/details"),
          //   child: Text("Go To Next Page"),
          // )
        ],
      ),
    );
  }
}

class LanguageSelectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LanguageController _controller = Get.find<LanguageController>();

    return Scaffold(
      appBar: MyAppBar(
        backgroundColor: Theme.of(context).cardColor,
        leadingType: AppBarBackType.Back,
        title: Text('Select language'),
      ),
      body: Container(
        child: ListView(
          children: languages.map((lang) {
            return InkWell(
              onTap: () {
                _controller.changeLanguage = lang.symbol;
              },
              child: Card(
                child: ListTile(
                  leading: Text(lang.symbol),
                  title: Text(lang.language),
                  trailing: lang.symbol == Get.locale.languageCode
                      ? SvgPicture.asset(
                          "assets/icons/tick.svg",
                          height: 35,
                        )
                      : null,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
