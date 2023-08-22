import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'bnb.dart';

class PageFour extends StatefulWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  State<PageFour> createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  List<String> imgs = ["assets/images/1.jpg","assets/images/1.jpg","assets/images/1.jpg","assets/images/1.jpg","assets/images/1.jpg"];
  bool isScroll = false;
  @override
  Widget build(BuildContext context) {

    var sz = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Page Four"),),
     body: SingleChildScrollView(
       child: Column(
         //mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Container(
             color: Colors.cyan,
             child: CarouselSlider(
                 items: [
                   GestureDetector(child: Image.asset("assets/images/1.jpg", fit: BoxFit.fill,),
                     onTap: (){

                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Image Pressed"),backgroundColor: Colors.red,));
                       print("====== Image Index Pressed ==========");
                     },),
                   GestureDetector(child: Image.asset("assets/images/1.jpg", fit: BoxFit.fill,),
                     onTap: (){
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Image Pressed"),backgroundColor: Colors.red,));
                       print("====== Image Index Pressed ==========");
                     },),
                   GestureDetector(child: Image.asset("assets/images/1.jpg", fit: BoxFit.fill,),
                     onTap: (){
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Image Pressed"),backgroundColor: Colors.red,));
                       print("====== Image Index Pressed ==========");
                     },),
                 ],
                 options: CarouselOptions(
                   scrollDirection: Axis.vertical,
                   initialPage: 0,
                   reverse: true,
                   autoPlay: true,
                   autoPlayInterval: Duration(seconds: 2)
                 )),
             constraints: BoxConstraints(minHeight: sz.height * 0.25, maxHeight: sz.height * 0.25, minWidth: 100 ),
           ),
           Container(
             constraints: BoxConstraints(minHeight: sz.height * 0.80 , maxHeight: sz.height * 0.80),
             child: Padding(
               padding:  EdgeInsets.all(sz .height * 0.01),
               child: GridView.builder(
                 physics: isScroll?AlwaysScrollableScrollPhysics():NeverScrollableScrollPhysics(),
                 scrollDirection: Axis.vertical,
                 itemCount: 41,
                   gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 5,crossAxisSpacing: 5)
                   , itemBuilder: (context, index) {
                     return GestureDetector(child: Image.asset("assets/images/1.jpg", fit: BoxFit.fill,),
                     onTap: (){
                       setState(() {
                         isScroll= !isScroll;
                       });
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Image $index Pressed"),backgroundColor: Colors.red,));
                       print("====== Image Index $index Pressed ==========");
                     },);
                   },),
             ),
           ),

           Container(color: Colors.red,
           constraints: BoxConstraints(
             minHeight: 250,
             maxHeight: 300
           ),
           )
         ],
       ),
     ),
     /* body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: SizedBox(height: 100,width: 100,),
              ),

              Card(
                color: Colors.black,
                child: SizedBox(height: 100,width: 100,),
              ),

              Image.asset("assets/images/1.jpg", fit: BoxFit.fill,)

            ],
          ),
        ),
      ),*/
      bottomNavigationBar: BNB(currentIndex: 2),
    );
  }
}
