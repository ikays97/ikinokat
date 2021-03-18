import 'package:flutter/foundation.dart';
import 'package:ikinokat/utils/request.dart';

class UserAPI {
  static Future addProduct({@required Map<String, dynamic> params}) async {
    var response = await RequestUtil().post('store/product', params: params);
    print(response);
  }

  // static Future editProduct() async {

  // }

  // static Future deleteProduct() async {

  // }
}
