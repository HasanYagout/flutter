import 'package:dio/dio.dart';
import 'package:doctor/Models/ProdModel.dart';
import 'package:flutter/cupertino.dart';

class ProdProvider extends ChangeNotifier{
    final Dio _dio;

  ProdProvider(this._dio){
    _dio
    ..options.connectTimeout = 10000
        ..options.responseType = ResponseType.json;
        
  }
  
  Future<List<ProdModel>> getAll()async{
    try{
      var response = await _dio.get("https://dummyjson.com/products");
      if(response.statusCode == 200){
        var res = response.data["products"] as List;
       var prodList= res.map((e) => ProdModel.fromJson(e)).toList();
       return prodList;
      }

      throw Exception("--- Error in get all products");

    }
    on DioError catch(err){
      throw Exception("--- Dio Error: ${err.message}");
    }
    on Exception catch(ex){
      throw Exception("--- Exp Error: ${ex.toString()}");
    }
  }
    
}