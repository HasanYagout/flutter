import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'bnb.dart';
import 'drawer.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  String title = "Default";
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text("args"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: (){},
                style: ElevatedButton.styleFrom(
                 foregroundColor: Colors.purple,
                  textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                  backgroundColor: Colors.orange,
                ),
                  child: Text("Ele Btn"),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("111"),
                  Text("111"),
                  Text("111"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("111"),
                  Text("111"),
                  Text("111"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("111"),
                  Text("111"),
                  Text("111"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("111"),
                  Text("111"),
                  Text("111"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("111"),
                  Text("111"),
                  Text("111"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("111", style: TextStyle(
                    color: Colors.red,
                    backgroundColor: Colors.green,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
                  Text("111"),
                  Text("111"),
                ],
              ),
            ],
          ),
          constraints: BoxConstraints(
            maxHeight: 350,
            minHeight: 150,
            minWidth: 150,
            maxWidth: 350
          ),
          color: Colors.cyan,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        child: Icon(Icons.check_circle_outline, color: Colors.black, size: 40),
        onPressed: () {
          title = "Counter: " + (counter++).toString();
          setState(() {
          });
        if (kDebugMode) {
          print("Im in floating btn... $title");
        }
      },),
      drawer: getDrawer(context),
      bottomNavigationBar: BNB(currentIndex: 1),
    );
  }
}
