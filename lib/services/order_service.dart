import 'package:ikinokat/models/brand.dart';
import 'package:ikinokat/models/order.dart';
import 'package:ikinokat/utils/request.dart';

class OrderAPI {
  static Future<OrderListModel> getOrdersData(String route) async {
    var response = await RequestUtil().get(route);
    return OrderListModel.fromJson(response['data']);
  }
}
