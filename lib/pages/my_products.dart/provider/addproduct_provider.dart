import 'package:flutter/widgets.dart';
import 'package:ikinokat/services/user_service.dart';

class AddProductProvider with ChangeNotifier {
  bool loading;

  AddProductProvider() {
    loading = false;
  }

  Future addUserProduct(data, {bool refresh = false}) async {
    loading = true;
    notifyListeners();
    bool response = await UserAPI.addProduct(params: data);
    print(response);
    loading = false;
    notifyListeners();
  }
}
