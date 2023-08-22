import 'package:cuisine/Home.dart';
import 'package:cuisine/account.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});


  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: "/home",
      routes: {
        "/home":(_)=> home(),
        "/account":(_)=> account(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String>slist=["item1"];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(

        child: Container(
child: ListView.builder(
itemCount: slist.length,
  itemBuilder: (context,index){
return Container(
  child: ListTile(
    onTap: (){
      print("item number ${slist[index]}");
    },
    trailing: Icon(Icons.add),
      title: Text(slist[index]),
  ),


);
  },
),

        ),
      ),

    );
  }
}
