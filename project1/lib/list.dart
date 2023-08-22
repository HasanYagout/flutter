import 'package:flutter/material.dart';

class list extends StatefulWidget {
  const list({Key? key}) : super(key: key);

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  List<String>slist=["item1"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list page"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: Colors.cyan,
          child: ListView.builder(

            itemCount: slist.length,
              itemBuilder:
              (context,index){

                return Container(
                child: ListTile(
                onTap: (){
                  print("item number ${slist[index]}");
    },
    leading: Icon(Icons.access_alarm),
    trailing: Text("$index"),
    title: Text(slist[index]),
                ),
                );
    },
        ),
      ),

      ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        slist.add("item"+(slist.length+1).toString());
        setState(() {

        });
      },
      child: Icon(Icons.add),
    ),
    );

  }
}
