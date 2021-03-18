import 'package:flutter/material.dart';
import 'package:ikinokat/models/category.dart';
import 'package:ikinokat/models/unit.dart';
import 'package:ikinokat/services/category_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoryProvider with ChangeNotifier {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  bool loading = true;
  List<CategoryModel> categories = [];
  List<UnitModel> units = [];

  CategoryProvider() {
    initData();
  }

  Future<void> initData({bool refresh = false}) async {
    CategoryModelList categoryResponse = await CategoryAPI.getCategoryData();
    UnitListModel res = await CategoryAPI.getUnits();
    units = res.list;
    categories = categoryResponse.list;
    loading = false;

    if (refresh) {
      categories = categoryResponse.list;
      units = res.list;
      loading = false;
      refreshController.refreshCompleted();
    }

    notifyListeners();
  }
}
