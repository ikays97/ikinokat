import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ikinokat/pages/login/login_page.dart';
import 'package:ikinokat/widgets/my_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoggedIn = false;

  Future<void> _checkAuthStatus() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = prefs.getBool('isLogged') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}

class ProfilePageContainer extends StatefulWidget {
  @override
  _ProfilePageContainerState createState() => _ProfilePageContainerState();
}

class _ProfilePageContainerState extends State<ProfilePageContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        leadingType: AppBarBackType.None,
        title: Text(
          'settings'.tr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Text('profile page'),
        ),
      ),
    );
  }
}
