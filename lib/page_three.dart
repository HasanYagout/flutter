import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_project/drawer.dart';
import 'package:first_project/page_one.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'bnb.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  Color clr = Colors.white;
  int currentIndex =0;
  int selected=0;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text("Page Three", style: TextStyle(fontFamily: "Khebrat")),centerTitle: true,),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CarouselSlider(
                items: [Text("1111111111"),Image.asset(
                  "assets/images/q.jpg",
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Icon(Icons.person),

                  filterQuality: FilterQuality.high,
                ),Text("3333333333"),],
                options: CarouselOptions(
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  initialPage: 1
                )),
            NavigationBar(
              selectedIndex: selected ,
              onDestinationSelected: (index){
                print("============ Pressed No: $selected ==========" );
              },
                destinations: [Icon(Icons.person), Icon(Icons.home), Icon(Icons.info_outline)],
            backgroundColor: Colors.red,
            ),
            Center(
              child: GestureDetector(
                onDoubleTap: (){
                  clr= Colors.white;
                  setState(() {
                  });
                },
                onLongPress: (){
                  setState(() {
                    clr= Colors.cyan;
                  });
                  print("======= Card Long Pressed ========");
                },
                onTap: (){

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content:  Text("hhhhhhh"),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 5),));
                  clr= Colors.red;
                  setState(() {
                  });
                  if (kDebugMode) {
                    print("======= Card Pressed ========");
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                  ),
                  shadowColor: Colors.green,
                  elevation: 5,
                  color: clr,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                    child: Text("Our Card"),
                  ),
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: BNB(currentIndex: 0),
        drawer: getDrawer(context),
      ),
    );
  }
}
