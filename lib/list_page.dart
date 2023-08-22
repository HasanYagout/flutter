import 'package:first_project/Models/ItemModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/ItemProvider.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int currentIndex =1;

  List<String> sList =["Item1", "Item2", "Item3"];
  @override
  Widget build(BuildContext context) {
    var itemProvider = Provider.of<ItemProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("List Page",),centerTitle: true,
      actions: [

        GestureDetector(child: Icon(Icons.shopping_cart),
        onTap: (){
          Navigator.of(context).pushNamed("/cart");
        },
        ),
        SizedBox(width: 20,),
        Center(child: Text("${itemProvider.cartItems.length}")),
        SizedBox(width: 20,),
      ],

      ),
      body: Center(child: Container(
        color: Colors.cyan,
        child: RefreshIndicator(
          onRefresh: ()async{

            print("00000000000000000");
          },
          child: ListView.builder(
              itemCount: itemProvider.itemes.length,
              itemBuilder: (context, index){
            return Container(
              child: ListTile(
                onTap: (){
                  print("Im in Item number: ${sList[index]}");
                },
                leading: CircleAvatar(
                  child: Image.asset("assets/images/${itemProvider.itemes[index].icon}",
                  fit: BoxFit.contain),
                ),
                trailing: IconButton(icon: Icon(Icons.add),
                onPressed: (){
                // itemProvider.DeleteItem(index);
                  itemProvider.AddToCart(index);
                },
                ),
                title: Text(itemProvider.itemes[index].name!),
              ),
            );
          }),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          sList.add("Item" + (sList.length + 1).toString());
          setState(() {
          });
        },
        child: Icon(Icons.add),
      ),
      /*bottomNavigationBar: BottomNavigationBar(

        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "User",
              icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "About",
            icon: Icon(Icons.info),
          )
        ],
        currentIndex: currentIndex,

      ),*/
    );
  }
}
