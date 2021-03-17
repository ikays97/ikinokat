import 'package:flutter/widgets.dart';
import 'package:ikinokat/models/brand.dart';
import 'package:ikinokat/models/product.dart';
import 'package:ikinokat/services/brand_service.dart';
import 'package:ikinokat/services/products_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GetBrandsProvider with ChangeNotifier {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  List<BrandModel> userBrands = [];
  bool loading = true;
  int _page;

  GetBrandsProvider() {
    getUserBrands();
  }

  Future getUserBrands({bool refresh = false}) async {
    _page = 1;
    BrandListModel res = await BrandAPI.getBrandsData('my-brands?page=$_page');
    userBrands = res.list;
    loading = false;
    _page = 2;
    if (refresh) {
      BrandListModel res =
          await BrandAPI.getBrandsData('my-brands?page=$_page');
      userBrands = res.list;
      loading = false;
      refreshController.refreshCompleted();
    }
    notifyListeners();
  }

  Future loadMoreProducts({bool refresh = false}) async {
    BrandListModel res = await BrandAPI.getBrandsData('my-brands?page=$_page');
    userBrands = res.list;
    loading = false;
    if (userBrands.length < 100) {
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
    _page += 1;
    notifyListeners();
  }
}
