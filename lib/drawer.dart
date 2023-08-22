import 'package:first_project/page_one.dart';
import 'package:first_project/page_three.dart';
import 'package:first_project/page_two.dart';
import 'package:flutter/material.dart';

Drawer getDrawer(BuildContext context){
  return Drawer(
    child: Column(
      children: [
        SizedBox(height: 175,child: CircleAvatar(
          child: Image.asset(
              "assets/images/q.jpg",
              fit: BoxFit.contain,width: 85,height: 85,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.person),

            filterQuality: FilterQuality.high,
          ),
          backgroundColor: Colors.white,
          radius: 50,
        )),

        ListTile(
          title: Text("Page One"),
          leading: Icon(Icons.home),
          trailing: Icon(Icons.home),
          onTap: (){
            Navigator.of(context).pushNamed("/one", arguments:"test Args" );
            /*Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
              return PageOne();
            }));*/
          },
        ),
        ListTile(
          title: Text("Page Two"),
          leading: Icon(Icons.settings),
          trailing: Icon(Icons.settings),
          onTap: (){
            Navigator.of(context).pushNamed("/two");
          },
        ),
        ListTile(
          title: Text("Page Three"),
          leading: Icon(Icons.search_rounded),
          trailing: Icon(Icons.search),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return PageThree();
            }));
          },
        ),
      ],
    ),
    backgroundColor: Colors.red,
  );
}