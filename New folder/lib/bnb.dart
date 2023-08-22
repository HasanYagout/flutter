import 'package:flutter/material.dart';

class bnb extends StatefulWidget {
  const bnb({Key? key, required this.currentIndex}) : super(key: key);
  final int currentIndex ;
  @override
  State<bnb> createState() => _bnbState();
}

class _bnbState extends State<bnb> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index){
        switch(index)
        {
          case 0: Navigator.of(context).pushReplacementNamed("/account"); break;
          case 1: Navigator.of(context).pushReplacementNamed("/home"); break;
          case 2: Navigator.of(context).pushReplacementNamed("/three"); break;
          default: Navigator.of(context).pushReplacementNamed("/four");
        }

      },
currentIndex: widget.currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person),label: "Account"),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline),label: "About"),


        ],
       );
  }
}
