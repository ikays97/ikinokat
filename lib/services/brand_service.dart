import 'package:dio/dio.dart';
import 'package:ikinokat/models/brand.dart';
import 'package:ikinokat/utils/request.dart';

class BrandAPI {
  static Future<BrandListModel> getBrandsData(
    String route, {
    params,
    Options options,
  }) async {
    var response = await RequestUtil().get(route, params: params);
    return BrandListModel.fromJson(response['data']);
  }
}
