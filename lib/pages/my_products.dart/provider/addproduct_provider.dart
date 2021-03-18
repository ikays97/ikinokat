import 'package:flutter/widgets.dart';

class AddProductProvider with ChangeNotifier {
  bool loading = false;

  AddProductProvider() {
    addUserProduct();
  }

  Future addUserProduct({bool refresh = false}) async {
    loading = true;
    notifyListeners();

    notifyListeners();
  }
}
