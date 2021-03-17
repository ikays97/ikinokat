import 'package:ikinokat/models/brand.dart';
import 'package:ikinokat/utils/request.dart';

class BrandAPI {
  static Future<BrandListModel> getBrandsData(String route) async {
    var response = await RequestUtil().get(route);
    return BrandListModel.fromJson(response['data']);
  }
}
