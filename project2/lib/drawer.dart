import 'package:flutter/material.dart';
import 'package:project2/page_one.dart';
import 'package:project2/page_two.dart';

Drawer getdrawer(BuildContext context){
return Drawer(
child: Column(
children: [
  SizedBox(

    height: 200,
child: CircleAvatar(
backgroundColor: Colors.black,
  radius: 50,
),
  ),
  ListTile(
    title: Text("list one"),
     leading: Icon(Icons.access_alarm),
    trailing: Icon(Icons.add),
    onTap: (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return pageone();
      }));
    },
  ),
  ListTile(
    title: Text("list two"),
    leading: Icon(Icons.access_alarm),
    trailing: Icon(Icons.add),
    onTap: (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
        return pagetwo();
      }));
    },
  ),
  ListTile(
    title: Text("list three"),
    leading: Icon(Icons.access_alarm),
    trailing: Icon(Icons.add),
  ),
],

),
  backgroundColor: Colors.red,
);
}