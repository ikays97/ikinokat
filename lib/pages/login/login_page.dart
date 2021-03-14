import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ikinokat/config/validators.dart';
import 'package:ikinokat/pages/login/provider.dart/login_provider.dart';
import 'package:ikinokat/pages/profile/profile_page.dart';
import 'package:ikinokat/utils/navigator.dart';
import 'package:ikinokat/widgets/my_appbar.dart';
import 'package:ikinokat/widgets/my_custom_button.dart';
import 'package:ikinokat/widgets/my_textformfield.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: Scaffold(
        appBar: MyAppBar(
          context: context,
          leadingType: AppBarBackType.None,
        ),
        body: SafeArea(
          child: LoginPageContainer(),
        ),
      ),
    );
  }
}

class LoginPageContainer extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<LoginProvider>(context);
    // login function
    var doLogin = () async {
      Map<String, String> data = {
        'email': _usernameController.text,
        'password': _passwordController.text,
      };
      await state.login(data: data);
      if (state.isLoggedIn) {
        var prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLogged', true);
        MyNavigator.pushAndRemove(ProfilePage());
      } else {
        print('tazeden synansh (login).');
      }
    };
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                MyTextFormField(
                  controller: _usernameController,
                  validator: validateName,
                  hintText: 'Username',
                ),
                MyTextFormField(
                  controller: _passwordController,
                  validator: validatePassword,
                  hintText: 'Password',
                ),
                state.loading
                    ? CupertinoActivityIndicator()
                    : MyCustomButton(
                        onTap: doLogin,
                        text: 'Login',
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
