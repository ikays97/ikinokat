import 'package:ikinokat/models/product.dart';
import 'package:ikinokat/utils/request.dart';
// import 'package:yupekyol/utils/request.dart';

class ProductsGridAPI {
  static Future<ProductListModel> getProductsData(String route) async {
    var response = await RequestUtil().get(route);
    // var response = await RequestUtil().get(route);
    return ProductListModel.fromJson(response['data']);
  }

  static Future<ProductListModel> searchProduct(
      String route, String query) async {
    Map<String, String> data = {'search': query};
    var response = await RequestUtil().post(route, params: data);
    // var response = await RequestUtil().get(route);
    return ProductListModel.fromJson(response['data']);
  }
}
