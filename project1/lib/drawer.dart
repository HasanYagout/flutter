import 'package:flutter/material.dart';
import 'package:project1/page_one.dart';
import 'package:project1/page_two.dart';

Drawer getDrawer(BuildContext context) {
  return Drawer(
      child: Column(children: [
    SizedBox(
        height: 175,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50,
        )),
    ListTile(
      title: Text("Page one"),
      leading: Icon(Icons.home),
      trailing: Icon(Icons.home),
      onTap: (){
        // Navigator.of(context).push(MaterialPageRoute(builder:(context){
        //   return pageone();
        // }));
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
          return pageone();
        }));
      },
    ),

        ListTile(
          title: Text("Page Two"),
          leading: Icon(Icons.access_alarm),
          trailing: Icon(Icons.access_alarm),
          onTap: (){
            // Navigator.of(context).push(MaterialPageRoute(builder:(context){
            //   return pageone();
            // }));
            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context){
            //   return pagetwo();
            // }));
            Navigator.of(context).pushNamed("/two");

          },
        ),

  ]),
          backgroundColor: Colors.red,
  );


}
