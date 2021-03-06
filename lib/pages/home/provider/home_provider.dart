import 'package:flutter/material.dart';
import 'package:ikinokat/models/product.dart';
import 'package:ikinokat/models/slider.dart';
import 'package:ikinokat/services/productsGrid_service.dart';
import 'package:ikinokat/services/slider_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeProvider with ChangeNotifier {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  bool loading = true;
  List<SliderModel> sliders = [];
  List<ProductItemModel> vipProducts = [];
  List<ProductItemModel> trandProducts = [];

  HomeProvider() {
    initData();
  }

  Future<void> initData({bool refresh = false}) async {
    SliderListModel sliderResponse = await SliderAPI.getSlidersData();
    ProductListModel vipResponse =
        await ProductsGridAPI.getProductsData("vip-products");
    ProductListModel trandResponse =
        await ProductsGridAPI.getProductsData("trand-products");

    sliders = sliderResponse.list;
    vipProducts = vipResponse.list;
    trandProducts = trandResponse.list;
    loading = false;

    if (refresh) {
      sliders = sliderResponse.list;
      vipProducts = vipResponse.list;
      trandProducts = trandResponse.list;
      loading = false;
      refreshController.refreshCompleted();
    }

    notifyListeners();
  }
}
