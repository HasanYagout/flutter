import 'package:doctor/Controllers/depts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeptsPage extends StatefulWidget {
  const DeptsPage({Key? key}) : super(key: key);

  @override
  State<DeptsPage> createState() => _DeptsPageState();
}

class _DeptsPageState extends State<DeptsPage> {
  @override
  Widget build(BuildContext context) {
    var deptProvider = Provider.of<DeptsProvider>(context);
    deptProvider.setDepts();
    return Scaffold(
      body: Center(child: Container(
        color: Colors.cyan,
        child: RefreshIndicator(
          onRefresh: ()async{

            print("00000000000000000");
          },
          child: ListView.builder(
              itemCount: deptProvider.depts.length,
              itemBuilder: (context, index){
                return Container(
                  child: ListTile(
                    onTap: (){
                      // print("Im in Item number: ${sList[index]}");
                    },
                    leading: CircleAvatar(
                      //child: Image.asset("assets/images/${doctorProvider.doctors[index].img}",fit: BoxFit.contain),
                    ),
                    trailing: IconButton(icon: Icon(Icons.add),
                      onPressed: (){
                        // itemProvider.DeleteItem(index);
                        //  itemProvider.AddToCart(index);
                      },
                    ),
                    title: Text(deptProvider.depts[index].name!),
                  ),
                );
              }),
        ),
      )),
    );
  }
}
