/// Id : 12
/// Name : "Item2"
/// Icon : "image.png"

class ItemModel {
  ItemModel({
      this.id, 
      this.name, 
      this.icon,});

  ItemModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    icon = json['Icon'];
  }
  int? id;
  String? name;
  String? icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Icon'] = icon;
    return map;
  }

}