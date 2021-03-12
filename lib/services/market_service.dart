import 'package:ikinokat/models/province.dart';
import 'package:ikinokat/utils/request.dart';

class MarketAPI {
  static Future<ProvinceListModel> getMarketData() async {
    var response = await RequestUtil().get('provinces');
    return ProvinceListModel.fromJson(response['data']);
  }
}
