class DeptsModel {
  DeptsModel({
      this.id, 
      this.name,});

  DeptsModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    return map;
  }

}