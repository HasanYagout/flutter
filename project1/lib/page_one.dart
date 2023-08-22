import 'package:flutter/material.dart';
import 'package:project1/drawer.dart';

class pageone extends StatefulWidget {
  const pageone({Key? key}) : super(key: key);

  @override
  State<pageone> createState() => _pageoneState();
}

class _pageoneState extends State<pageone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("page one"),
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 300,
          color: Colors.lightGreenAccent,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                color: Colors.lightBlue,
                height: 50,
              ),
              SizedBox(height: 50,),
              Container(
                height: 20,color: Colors.yellow,
              ),
              Expanded(child: Container(
                color: Colors.purple,
              )),
              Container(
                color: Colors.cyan,
                height: 150,
              ),
            ],
          ),


        ),
      ),
      drawer: getDrawer(context),
    );
  }
}
