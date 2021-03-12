import 'package:ikinokat/models/supplier.dart';
import 'package:ikinokat/utils/request.dart';

class SupplierAPI {
  static Future<SupplierModel> getSupplierData(int supplierId) async {
    var response = await RequestUtil().get('provider/$supplierId');
    return SupplierModel.fromJson(response['data']);
  }
}
