import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class pagethree extends StatefulWidget {
  const pagethree({Key? key}) : super(key: key);

  @override
  State<pagethree> createState() => _pagethreeState();
}

class _pagethreeState extends State<pagethree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("page three"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.cyan,
            child: CarouselSlider(items: [
              GestureDetector(child: Image.asset("assets/images/tree.jpg", fit: BoxFit.fill,)),
              GestureDetector(child: Image.asset("assets/images/tree.jpg", fit: BoxFit.fill,)),
              GestureDetector(child: Image.asset("assets/images/tree.jpg", fit: BoxFit.fill,)),
            ],
        options: CarouselOptions(
          scrollDirection: Axis.vertical,
          initialPage: 0,
          reverse: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 2)
        ),

            ),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 500,minHeight: 500),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 41,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisSpacing: 5,crossAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return GestureDetector(child: Image.asset("assets/images/tree.jpg", fit: BoxFit.fill,),
                      onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("image $index pressed"),backgroundColor: Colors.red,),);
                      },
                    );

                  },),
            ),
          ),
        ],
      ),
      // body: Container(
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Card(
      //           child: SizedBox(height: 100,width: 100,),
      //         ),
      //         Card(
      //           child: SizedBox(height: 100,width: 100,),
      //         ),
      //         Image.asset("assets/images/tree.jpg", fit: BoxFit.fill,),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
