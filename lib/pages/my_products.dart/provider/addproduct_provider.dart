import 'package:flutter/widgets.dart';
import 'package:ikinokat/services/user_service.dart';

class AddProductProvider with ChangeNotifier {
  bool loading;
  bool isAdded = false;

  AddProductProvider() {
    loading = false;
  }

  Future addUserProduct(data, {bool refresh = false}) async {
    loading = true;
    notifyListeners();
    bool response = await UserAPI.addProduct(params: data);
    isAdded = response;
    print(response);
    loading = false;
    notifyListeners();
  }
}

// data: {
//    'name_tm': _ady,
//    'cat_id': categories.indexOf(_bolumi),
//    'brand_id': userBrands.indexOf(_markasy),
//    'unit_id': units.indexOf(_unit),
//    'images': images,
// },
