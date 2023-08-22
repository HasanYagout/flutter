
import 'package:dio/dio.dart';
import 'package:doctor/Models/LoginModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountsProvider extends ChangeNotifier{
    final Dio _dio;

  AccountsProvider(this._dio){
    _dio
      ..options.connectTimeout = 10000
      ..options.responseType = ResponseType.json;
  }


  Future<LoginModel> login(Map<String, dynamic> body)async{
    try{
      var response = await _dio.post("https://api.eshaibani.com/login", data: body);
      if(response.statusCode == 200){
        print("RESPONSE: ${response}");
        var res = response.data;
        var user = LoginModel.fromJson(res);
        return user;
      }

      throw Exception("--- Error in login");

    }
    on DioError catch(err){
      throw Exception("--- Dio Error: ${err.message}");
    }
    on Exception catch(ex){
      throw Exception("--- Exp Error: ${ex.toString()}");
    }
  }

  Future<dynamic> getResources()async{
    try{
      var shared =await SharedPreferences.getInstance();
      var token = shared.getString("token");
      var response = await _dio.get("https://dummyjson.com/auth/RESOURCE",options: Options(headers: {"Authorization": "Bearer $token",'Content-Type': 'application/json'}));

      if(response.statusCode == 200){
        //var res = response.data["products"] as List;
        //var prodList= res.map((e) => ProdModel.fromJson(e)).toList();
        return response.data;
      }

      throw Exception("--- Error in get resources");

    }
    on DioError catch(err){
      print("Response: ${err.response!.data}");
      throw Exception("--- Dio Error: ${err.message}");
    }
    on Exception catch(ex){
      throw Exception("--- Exp Error: ${ex.toString()}");
    }
  }

}