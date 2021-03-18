class UnitModel {
  int id;
  String name_tm;
  String name_ru;
  String name_en;

  UnitModel({
    this.id,
    this.name_tm,
    this.name_en,
    this.name_ru,
  });

  UnitModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name_tm = json['name_tm'],
        name_en = json['name_en'],
        name_ru = json['name_ru'];
}

class UnitListModel {
  List<UnitModel> list;
  UnitListModel({this.list});
  factory UnitListModel.fromJson(dynamic json) {
    var items = json as List;
    var itemModels = items.map((item) {
      return UnitModel.fromJson(item);
    }).toList();
    return UnitListModel(list: itemModels);
  }
}
