class ProductItemModel {
  int id;
  String picurl;
  String name_tm;
  String name_ru;
  String name_en;
  String price;
  ProductItemModel({
    this.id,
    this.picurl,
    this.name_en,
    this.name_ru,
    this.name_tm,
    this.price,
  });
  ProductItemModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        picurl = json['image'],
        name_tm = json['name_tm'],
        name_ru = json['name_ru'],
        name_en = json['name_en'];
}

class ProductListModel {
  List<ProductItemModel> list;

  ProductListModel({this.list});
  factory ProductListModel.fromJson(dynamic json) {
    List list = (json as List).map((i) {
      return ProductItemModel.fromJson(i);
    }).toList();

    return ProductListModel(list: list);
  }
}
