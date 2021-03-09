import 'package:ikinokat/models/detail.dart';
import 'package:ikinokat/utils/request.dart';

class DetailAPI {
  static Future<DetailItemModel> getDetailData(int id) async {
    var response = await RequestUtil().get('product/$id');
    return DetailItemModel.fromJson(response['data']);
  }
}
