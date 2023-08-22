import 'package:dio/dio.dart';
import 'package:doctor/Models/ProductModel.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier{
final Dio _dio;
  ProductProvider(this._dio){
    _dio
        ..options.responseType = ResponseType.json
        ..options.connectTimeout = 15000;
  }

  Future<List<ProductModel>> getProducts()async{
    try{
      var response = await _dio.get("https://dummyjson.com/products");
      print("---- in product provider get : ${response.data}");
      if(response.statusCode == 200){
        var data = response.data["products"] as List ;
       var products = data.map((e) => ProductModel.fromJson(e)).toList();
       return products;
      }
      throw Exception();
    }
    on DioError catch(err){
      throw Exception(err.message);
    }
    on Exception catch(ex){
      throw ex;
    }
  }

  Future<ProductModel> addProduct(Map<String, dynamic> data)async{
    try{
      var res = await _dio.post("https://dummyjson.com/products/adda", data: data);
      if(res.statusCode == 200){
        var dt = res.data as Map;
        var prod = ProductModel.fromJson(dt);
        return prod;
      }
      throw Exception("adding failed!");
    }
    on DioError catch(err){
      throw Exception(err.message);
    }

    on Exception catch(ex){
      throw Exception("Exception in add product!");
    }
  }


}