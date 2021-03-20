import 'package:flutter/widgets.dart';
import 'package:ikinokat/models/product.dart';
import 'package:ikinokat/services/products_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GetProductsProvider with ChangeNotifier {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  List<ProductItemModel> userProducts = [];
  bool loading = true;

  GetProductsProvider() {
    getUserProducts();
  }

  Future getUserProducts({bool refresh = false}) async {
    var res = await ProductsGridAPI.getProductsData('my-products');
    userProducts = res.list;
    loading = false;
    if (refresh) {
      var res = await ProductsGridAPI.getProductsData('my-products');
      userProducts = res.list;
      loading = false;
      refreshController.refreshCompleted();
    }
    notifyListeners();
  }

  // Future loadMoreProducts({bool refresh = false}) async {
  //   ProductListModel res =
  //       await ProductsGridAPI.getProductsData('my-products?page=$_page');
  //   userProducts += res.list;
  //   loading = false;
  //   if (userProducts.length < 100) {
  //     refreshController.loadComplete();
  //   } else {
  //     refreshController.loadNoData();
  //   }
  //   _page += 1;
  //   notifyListeners();
  // }
}
