

import 'package:flutter/material.dart';
import 'models/Itemmodel.dart';
class ItemProvider extends ChangeNotifier{
  List<Itemmodel> items=[
    Itemmodel(id: 21,name: "item21",icon:"1.jpg" ),
    Itemmodel(id: 22,name: "item22",icon:"1.jpg" ),
    Itemmodel(id: 23,name: "item23",icon:"1.jpg" ),
    Itemmodel(id: 24,name: "item24",icon:"1.jpg" ),
  ];
  void DeleteItem(int index){
    items.removeAt(index);
    notifyListeners();
  }
  List<Itemmodel>cartlist=[];
}