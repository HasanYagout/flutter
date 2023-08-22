/// Id : 1
/// Name : "doctor name"
/// MajorId : 1
/// Image : "img"

class DoctorModel {
  DoctorModel({
      this.id, 
      this.name, 
      this.majorId, 
      this.image,});

  DoctorModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    majorId = json['MajorId'];
    image = json['Image'];
  }
  int? id;
  String? name;
  int? majorId;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['MajorId'] = majorId;
    map['Image'] = image;
    return map;
  }

}