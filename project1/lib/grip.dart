
import 'package:flutter/material.dart';

import 'drawer.dart';

class GridPage extends StatefulWidget {
  const GridPage({Key? key}) : super(key: key);

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  @override
  Widget build(BuildContext context) {
    var sz = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: ()async {
        bool x=false;
        var ex = await showDialog<bool>(
          useSafeArea: true,
          context: context, builder: (context) {
          return AlertDialog(
            title: Text("هل تريد الخروج من التطبيق؟"),
            actions: [
              TextButton(onPressed: (){x= true;
              Navigator.of(context).pop();
              }, child: Text("نعم", style: TextStyle(color: Colors.black))),

              TextButton(onPressed: (){x=false;
              Navigator.of(context).pop();

                }, child: Text("لا", style: TextStyle(color: Colors.black),)),
            ],
            content: Container(

              constraints: BoxConstraints(
                maxHeight: 50,
                maxWidth: 150,
                minWidth: 150,
                minHeight: 50
              ),
              color: Colors.white,
              height: 150,
              width: 150,
            ),
          );
        },);
        return x;
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Grid Page"),),
        drawer: getDrawer(context),
        body: Column(
          children: [
            Container(
              height: sz.height/100 * 88.5,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: GridView.builder(
                  itemCount: 11,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 3)
                    , itemBuilder: (context, index) {
                      return Container(
                        color: Colors.greenAccent,
                        child: Image.asset(
                          "assets/images/1.jpg",
                          fit: BoxFit.fill,width: 85,height: 85,
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.person),

                          filterQuality: FilterQuality.high,
                        ),
                      );
                    },),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
