import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/ItemProvider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var itemProvider = Provider.of<ItemProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Cart"),),
      body: Container(
        child: ListView.builder(
            itemCount: itemProvider.cartItems.length,
            itemBuilder: (context, index){
              return Container(
                child: ListTile(
                  onTap: (){

                  },
                  leading: CircleAvatar(
                    child: Image.asset("assets/images/${itemProvider.cartItems[index].icon}",
                        fit: BoxFit.contain),
                  ),
                  trailing: IconButton(icon: Icon(Icons.delete),
                    onPressed: (){
                      // itemProvider.DeleteItem(index);
                      //itemProvider.AddToCart(index);
                      itemProvider.DeleteFromCart(index);
                    },
                  ),
                  title: Text(itemProvider.cartItems[index].name!),
                ),
              );
            }),
      ),
    );
  }
}
