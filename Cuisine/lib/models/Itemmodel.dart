class Itemmodel {
  Itemmodel({
    this.id,
    this.name,
    this.icon,});

  Itemmodel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    icon = json['major'];
  }

  int? id;
  String? name;
  String? icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['major'] = icon;
    return map;
  }

}