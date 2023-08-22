
import 'package:first_project/Models/ItemModel.dart';
import 'package:flutter/cupertino.dart';

class ItemProvider extends ChangeNotifier{
  List<ItemModel> itemes = [
    ItemModel(id: 21, name: "Item21", icon: "1.jpg"),
    ItemModel(id: 35, name: "Item35", icon: "1.jpg"),
    ItemModel(id: 43, name: "Item43", icon: "q.jpg"),
    ItemModel(id: 87, name: "Item21", icon: "1.jpg"),
    ItemModel(id: 32, name: "Item35", icon: "1.jpg"),
    ItemModel(id: 44, name: "Item43", icon: "q.jpg"),
  ];
  List<ItemModel> cartItems =[];

  void AddToCart(int index){
    var item = itemes.elementAt(index);
    cartItems.add(item);
    notifyListeners();
  }
  void DeleteItem(int index){
    itemes.removeAt(index);
    notifyListeners();
  }

  void DeleteFromCart(int index){
    cartItems.removeAt(index);
    notifyListeners();
  }




}