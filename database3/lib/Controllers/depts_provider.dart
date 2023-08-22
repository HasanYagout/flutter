
import 'package:doctor/Helpers/DbHelper.dart';
import 'package:doctor/Models/DeptsModel.dart';
import 'package:flutter/cupertino.dart';

class DeptsProvider extends ChangeNotifier{

  List<DeptsModel> depts=[];
  Future<List<Map<String, dynamic>>> getDepts()async{
    var depts = await SQL_Helper().getAll("Depts");
    return depts;
  }

  void setDepts()async{
    var data = await getDepts();
    List<DeptsModel> ds=[];
    for(var d in data){
      ds.add(DeptsModel.fromJson(d));
    }
    depts = ds;
    notifyListeners();
  }

  Future<bool> addDepts(DeptsModel dept)async{
    try {
      var res = await SQL_Helper().add("Depts",dept.toJson() );
      if(res ==1){
        setDepts();
      }
      return true;
    } on Exception catch (e) {
      return false;
    }
  }
}