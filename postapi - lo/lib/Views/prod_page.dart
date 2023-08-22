import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/Controllers/account_provider.dart';
import 'package:doctor/Controllers/prod_provider.dart';
import 'package:doctor/Views/prod_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProdPage extends StatefulWidget {
  const ProdPage({Key? key}) : super(key: key);

  @override
  State<ProdPage> createState() => _ProdPageState();
}

class _ProdPageState extends State<ProdPage> {
  @override
  Widget build(BuildContext context) {
    var prodProvider = Provider.of<ProdProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Api Testss",),
      actions: [TextButton(onPressed: (){
        Navigator.of(context).pushReplacementNamed("/login");
      }, child: Text("login",style: TextStyle(color: Colors.red))),
        TextButton(onPressed: ()async{
          try{
            var accProvider = Provider.of<AccountsProvider>(context, listen: false);
            var res = await accProvider.getResources();
          }
          catch(e){
            showDialog(context: context, builder: (context) => AlertDialog(
              content: Container(
                child: Text("${e.toString()}"),
              ),
            ),);
          }
         // Navigator.of(context).pushReplacementNamed("/login");
        }, child: Text("resources",style: TextStyle(color: Colors.red)))
      ],),
      body: Center(
        child: Container(
          child: FutureBuilder(
            future: prodProvider.getAll(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if(snapshot.hasError){
                return Center(child: Text("Error! ${snapshot.error.toString()}"),);
              }

              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: (){
                           /* showDialog(context: context, builder: (context) =>
                              AlertDialog(
                                title: Text(snapshot.data![index].title!),
                                content: Container(
                                  constraints: BoxConstraints(
                                    maxHeight: 470,
                                    minHeight: 300
                                  ),
                                  child: Column(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: snapshot.data![index].images!.first,
                                        placeholder: (context, url) => CircularProgressIndicator(),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                      ),
                                      SizedBox(height: 15,),
                                      Text(snapshot.data![index].description!)
                                    ],
                                  ),
                                ),
                              )
                              ,);*/
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProdDetails(prodModel: snapshot.data![index]),));
                          },
                          /*leading: CachedNetworkImage(
                            imageUrl: snapshot.data![index].images!.last,
                          ),*/
                          trailing: Image.network(snapshot.data![index].images!.first),
                          title: Text("title: ${snapshot.data![index].title}"),
                          subtitle: Text("price: ${snapshot.data![index].price}"),
                        );
                      },);
                }
                else return Center(child: Text("there is no data"),);
              }

              return Center(child: Text("something wrong!"),);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          Navigator.of(context).pushNamed("/addProd");
        }
        ,
        child: Icon(Icons.add),
      ),
    );
  }
}
