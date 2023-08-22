import 'package:carousel_slider/carousel_slider.dart';
import 'package:cuisine/bnb.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int currentindex=0;
  List<String>slist=["بهارات طبيخ","بهارات زربيان","بهارات سلته وفحسه"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Column(
children: [
  Container(
child: CarouselSlider(items: [
  GestureDetector(child: Image.asset("assets/images/1.jpg", fit: BoxFit.fill,)),
  GestureDetector(child: Image.asset("assets/images/2.jpg", fit: BoxFit.fill,)),
  GestureDetector(child: Image.asset("assets/images/3.jpg", fit: BoxFit.fill,)),
], options: CarouselOptions(
  autoPlayInterval: Duration(seconds: 2),
  reverse: true,
  initialPage: 0,
  scrollDirection: Axis.horizontal,
   autoPlay: true
),),
  ),
  Container(

    height: 400,
    child: ListView.builder(
      itemCount: slist.length,

        itemBuilder: (context, index) {
          return Container(
child: ListTile(
trailing: Icon(Icons.add),

  title: Center(child: Text(slist[index])),


),
          );
        },)
  ),


],

      ),
      bottomNavigationBar:bnb(currentIndex: 1,),
    );
  }
}
