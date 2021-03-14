import 'package:flutter/material.dart';
import 'package:ikinokat/services/login_service.dart';

class LoginProvider with ChangeNotifier {
  bool loading = false;
  bool isLoggedIn = false;

  Future<void> login({Map<String, String> data}) async {
    loading = true;
    notifyListeners();
    bool res = await LoginAPI.loginService(data: data);
    isLoggedIn = res;
    loading = false;
    notifyListeners();
  }
}
