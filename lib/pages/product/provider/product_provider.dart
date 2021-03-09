import 'package:flutter/widgets.dart';
import 'package:ikinokat/models/detail.dart';
import 'package:ikinokat/services/detail_service.dart';

class ProductDetailProvider with ChangeNotifier {
  final int productId;
  bool loading = true;
  DetailItemModel productDetail;

  ProductDetailProvider({this.productId}) {
    getData();
  }

  Future<void> getData() async {
    DetailItemModel detail = await DetailAPI.getDetailData(productId);
    productDetail = detail;
    loading = false;
    notifyListeners();
  }
}
