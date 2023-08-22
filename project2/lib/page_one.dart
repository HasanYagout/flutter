import 'package:flutter/material.dart';
import 'package:project2/drawer.dart';

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
        centerTitle: true,
      ),
      body:Center(
        child: Container(
          height: 400,
          width: 400,
          color: Colors.red,

          child: Column(
            children: [
              Container(
                color: Colors.cyan,
                      height: 30,
              ),
              SizedBox(
                height: 50,

              ),
              Container(
                color: Colors.green,
                height: 40,
              ),
              Container(
                color: Colors.black,
                height: 40,
              ),
              Expanded(child: Container(

                color: Colors.orange,
              ))
            ],
          ),

        ),
      ) ,
      drawer: getdrawer(context),
    );
  }
}
