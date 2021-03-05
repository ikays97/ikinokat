class CategoryModel {
  String slug;
  String name;
  String icon;
  CategoryModel({this.name, this.icon});
  CategoryModel.fromJson(Map<String, dynamic> json)
      : slug = json['slug'],
        name = json['name'],
        icon = json['icon'];
}

class CategoryModelList {
  List<CategoryModel> list;
  CategoryModelList({this.list});
  factory CategoryModelList.fromJson(dynamic json) {
    var items = json as List;
    var itemModals = items.map((item) {
      return CategoryModel.fromJson(item);
    }).toList();
    return CategoryModelList(list: itemModals);
  }
}
