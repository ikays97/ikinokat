class OrderModel {
  int id;
  String name;
  String phone;
  String message;
  int product_id;
  int user_id;
  int status;
  String created_at;

  OrderModel({
    this.id,
    this.name,
    this.phone,
    this.message,
    this.product_id,
    this.user_id,
    this.status,
    this.created_at,
  });

  OrderModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        phone = json['phone'],
        message = json['message'],
        product_id = json['product_id'],
        user_id = json['user_id'],
        status = json['status'],
        created_at = json['created_at'];
}

class OrderListModel {
  List<OrderModel> list;
  OrderListModel({this.list});
  factory OrderListModel.fromJson(dynamic json) {
    var items = json as List;
    var itemModels = items.map((item) {
      return OrderModel.fromJson(item);
    }).toList();
    return OrderListModel(list: itemModels);
  }
}
