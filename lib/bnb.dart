import 'package:flutter/material.dart';

class BNB extends StatefulWidget {
   BNB({Key? key, required this.currentIndex}) : super(key: key);
  final int currentIndex ;

  @override
  State<BNB> createState() => _BNBState();
}

class _BNBState extends State<BNB> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index){

        /*setState(() {
          currentIndex = index;
        });*/
        switch(index){
          case 0: Navigator.of(context).pushReplacementNamed("/one"); break;
          case 1: Navigator.of(context).pushReplacementNamed("/two"); break;
          case 2: Navigator.of(context).pushReplacementNamed("/three"); break;
          default: Navigator.of(context).pushReplacementNamed("/four");
        }
      },
      currentIndex: widget.currentIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Account", ),
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.info_outline),label: "About"),
      ],
    );
  }
}
