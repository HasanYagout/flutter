import 'package:doctor/Helpers/DbHelper.dart';
import 'package:doctor/Models/DoctorModel.dart';
import 'package:flutter/cupertino.dart';

class DoctorProvider extends ChangeNotifier{
    List<DoctorModel> doctors=[];
    Future<List<Map<String, dynamic>>> getDoctors()async{
        var dcts = await SQL_Helper().getAll("Doctor");
        return dcts;
    }

    void setDoctors()async{
        var data = await getDoctors();
        List<DoctorModel> ds=[];
        for(var d in data){
            ds.add(DoctorModel.fromJson(d));
        }
        doctors = ds;
        notifyListeners();
    }

    Future<bool> addDoctor(DoctorModel doctor)async{
        try {
          var res = await SQL_Helper().add("Doctor",doctor.toJson() );
          if(res ==1){
              setDoctors();
          }
          return true;
        } on Exception catch (e) {
          return false;
        }
    }

    Future<bool> updateDoctor(DoctorModel doctor)async{
      try {
        var res = await SQL_Helper().update("Doctor",doctor.toJson() );
        if(res ==1){
          setDoctors();
        }
        else{
          return false;
        }
        return true;
      } on Exception catch (e) {
        return false;
      }
    }
}
