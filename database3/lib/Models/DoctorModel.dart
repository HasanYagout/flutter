/// Id : 1
/// Name : "doctor name"
/// DeptId : 1
/// Img : "img"

class DoctorModel {
  DoctorModel({
      this.id, 
      this.name, 
      this.deptId,
      this.img,});

  DoctorModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    deptId = json['DeptId'];
    img = json['Img'];
  }
  int? id;
  String? name;
  int? deptId;
  String? img;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['DeptId'] = deptId;
    map['Img'] = img;
    return map;
  }

}