import 'package:ikinokat/models/category.dart';
import 'package:ikinokat/utils/request.dart';

class CategoryAPI {
  static Future<CategoryModelList> getCategoryData() async {
    var response = await RequestUtil().get('categories');
    return CategoryModelList.fromJson(response['data']);
  }
}
