import 'package:flutter/material.dart';
import 'package:ikinokat/models/slider.dart';
import 'package:ikinokat/services/slider_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeProvider with ChangeNotifier {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  bool loading = true;
  List<SliderModel> sliders = [];
  // List<ProductModel> vipProducts = [];
  // List<ProductModel> trandProducts = [];

  HomeProvider() {
    initData();
  }

  Future initData({bool refresh = false}) async {
    SliderListModel sliderResponse = await SliderAPI.getSlidersData();
    sliders = sliderResponse.list;
    loading = false;
    if (refresh) {
      sliders = sliderResponse.list;
      loading = false;
      refreshController.refreshCompleted();
    }
    notifyListeners();
  }
}
