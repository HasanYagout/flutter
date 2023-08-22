/// Id : 1
/// Name : "drugs"
/// Price : 100

class DrugsModel {
  DrugsModel({
      this.id, 
      this.name, 
      this.price,});

  DrugsModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    price = json['Price'];
  }
  int? id;
  String? name;
  int? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Price'] = price;
    return map;
  }

}