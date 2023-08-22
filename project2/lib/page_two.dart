import 'package:flutter/material.dart';
import 'package:project2/drawer.dart';

class pagetwo extends StatefulWidget {
  const pagetwo({Key? key}) : super(key: key);

  @override
  State<pagetwo> createState() => _pagetwoState();
}

class _pagetwoState extends State<pagetwo> {
  Color clr=Colors.deepOrange;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page two"),
      ),
      body: Center(
        child: GestureDetector(
          onDoubleTap: (){
            clr=Colors.lightBlueAccent;
            setState(() {

            });

          },
          onLongPress: (){
           clr=Colors.yellowAccent;
           setState(() {

           });
          },
          onTap: (){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("hello"),
            backgroundColor: Colors.lime,
                duration: Duration(seconds: 2),
            ),
          );
          setState(() {

          });

          },
          child: Card(
            shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(25)
            ),
            shadowColor: Colors.white54,
            elevation: 5,
            color: clr,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Text("fhfh"),
            ),
          ),
        ),


      ),
      drawer: getdrawer(context),
    );
  }
}
