import 'package:cuisine/bnb.dart';
import 'package:flutter/material.dart';

class account extends StatefulWidget {
  const account({Key? key}) : super(key: key);

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("account"),
        centerTitle: true,

      ),
 body: SafeArea(
   child: ListView(

     children: [
      Card(elevation: 3,),
     ],
   ),
 ),
      
bottomNavigationBar: bnb(currentIndex: 0,),

    );
  }
}
