import 'package:dio/dio.dart';
import 'package:ikinokat/models/category.dart';
import 'package:ikinokat/models/order.dart';
import 'package:ikinokat/models/unit.dart';
import 'package:ikinokat/utils/request.dart';

class CategoryAPI {
  static Future<CategoryModelList> getCategoryData() async {
    var response = await RequestUtil().get('categories');
    return CategoryModelList.fromJson(response['data']);
  }

  static Future<UnitListModel> getUnits() async {
    var response = await RequestUtil().get('add/product');
    return UnitListModel.fromJson(response['units']);
  }
}
