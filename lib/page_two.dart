

import 'package:flutter/material.dart';

import 'bnb.dart';
import 'drawer.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  List<String> sList =[];
  double rate(String start, String end){
    var s = DateTime.parse(start);
    var d = DateTime.parse(end);
    var df= d.difference(s);
    var dfn = d.difference(DateTime.now());
    print("Df: ${df.inDays} ----  Dfn: ${dfn.inDays}");
    return 100.00-(df.inDays / dfn.inDays *100);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Page two"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 200,
          color: Colors.green,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                color: Colors.grey,
                height: 50,
              ),
               SizedBox(height: 20,),

              Container(height: 20,color: Colors.yellow,),
              Expanded(child: Container(
                color: Colors.purple,

              )),
              ElevatedButton(
                onPressed: () {
                  var st = DateTime.now().add(Duration(days: -12));
                  var ed = DateTime.now().add(Duration(days: 12));
                  var cd = DateTime.now();
                  var all = ed.difference(st).inDays;
                  var fsh = cd.difference(st).inDays;
                  var rt = 100 / (all.toDouble() / fsh.toDouble());
                  print("All: ${all}")  ;
                  print("Finished: ${fsh}")  ;
                  print("Rate: ${rt}")  ;

                 // Navigator.of(context).pop();

                 /* sList.add("value");
                  print("Number of items in list is : ${sList.length}" );

                  print(sList);*/
                },
                child:  Text("Click"),),
              /*Card(
                semanticContainer: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  side: BorderSide(width: 1,color: Colors.brown)
                ),
                shadowColor: Colors.white,
                color: Colors.greenAccent,
                elevation: 2,
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("IN CARD"),
                ),
              ),*/
              Container(
                color: Colors.cyan,
                height: 150,
                width: 100,
              ),

            ],
          ),
        ),
      ),
     /* drawer: Drawer(
        backgroundColor: Colors.red,
        elevation: 6,
        width: 150,
        child: Column(
          children: [
            SizedBox(height: 150,),
            ListTile(title: Text("Home"),
            trailing: Icon(Icons.home),

            )
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(width: 2,color: Colors.white)
        ),
      ),*/
      //drawer: getDrawer(context),
      bottomNavigationBar: BNB(currentIndex: 2),
    );
  }
}
