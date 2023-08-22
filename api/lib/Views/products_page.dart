import 'package:doctor/Controllers/product_provider.dart';
import 'package:doctor/Models/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("products api"),),
      body: FutureBuilder(
        future: Provider.of<ProductProvider>(context).getProducts(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Container(
              child: Center(child: Text("${snapshot.error.toString()}")),
            );
          }


          if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text("${snapshot.data![index].title}"),);
          },);
        }


          return Center(child: CircularProgressIndicator(color: Colors.red,));
      },),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.update),
        onPressed: ()async{
          try {
            Map<String, dynamic> data = {
              "title": "my product",
              "description": " desc of my prod",
              "price": 423,
              "discountPercentage": 11.35,
              "rating": 3.35,
              "stock": 67

            };
            var prodProvider = Provider.of<ProductProvider>(context, listen: false);
            var res = await prodProvider.addProduct(data);
            showDialog(context: context, builder: (context) => AlertDialog(
              content: Container(
                child: Center(
                  child: Text("title: ${res.title}"),
                ),
              ),
            ),);
            print("===== res in products page: ${res}");
          } on Exception catch (e) {
            showDialog(context: context, builder: (context) => AlertDialog(
              content: Container(
                child: Center(
                  child: Text("Error!: ${e.toString()}"),
                ),
              ),
            ),);
          }
        },
      ),
    );
  }
}
