import 'package:flutter/foundation.dart';
import 'package:ikinokat/utils/request.dart';

class UserAPI {
  static Future addProduct({@required params}) async {
    var response = await RequestUtil().post('store/product', params: params);
    if (response['product'] != null) {
      return true;
    } else {
      return false;
    }
  }

  // static Future editProduct() async {

  // }

  // static Future deleteProduct() async {

  // }
}
