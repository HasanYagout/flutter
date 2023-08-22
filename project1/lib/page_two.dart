import 'package:flutter/material.dart';

class pagetwo extends StatefulWidget {

  const pagetwo({Key? key}) : super(key: key);

  @override
  State<pagetwo> createState() => _pagetwoState();
}

class _pagetwoState extends State<pagetwo> {
  Color clr=Colors.white;
  int currentindex=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("page two"),
      ),
      body: Center(
        child: GestureDetector(
          onDoubleTap: (){
             clr=Colors.white;
             setState(() {

             });

          },
          onLongPress: (){
            setState(() {
              clr=Colors.cyan;
            });
          },
          onTap: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("hhhhhh"),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 5),
              ),
            );
            clr=Colors.red;
            setState(() {

            });
            
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            shadowColor: Colors.green,
            elevation: 5,
            color: clr,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 50),
              child: Text("hh"),
            ),
          ),
        ),
        
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            currentindex=index;
          });
        },
        currentIndex: currentindex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Account"),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline),label: "about"),

        ],
      ),
      
    );
  }
}
