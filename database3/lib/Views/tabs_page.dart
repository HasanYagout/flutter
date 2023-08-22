import 'package:doctor/Views/add_dept.dart';
import 'package:doctor/Views/add_doctor.dart';
import 'package:doctor/Views/depts_page.dart';
import 'package:doctor/Views/doctors_page.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
    child: Scaffold(
      appBar: AppBar(
        title: Text("Tabs Page"),
        centerTitle: true,
        bottom: TabBar(

          onTap: (idx){
            setState(() {
              currentIndex = idx;
            });
          },
          tabs: [
            Text("Doctors"),
            Text("Depts"),
            Text("Drugs"),
          ],
        ),
      ),
      body: TabBarView(

          children: [
        Container(
          color: Colors.yellow,
          child: DoctorsPage(),
        ),
        Container(
          color: Colors.green,
          child: DeptsPage(),
        ),
        Container(
          color: Colors.purple,
        ),
      ]),
      floatingActionButton: getBtn(currentIndex, context)
    )
    );
  }
}

FloatingActionButton getBtn(int index, BuildContext context){
  if(index == 0){
    return FloatingActionButton(
      onPressed: (){
        showDialog(context: context, builder: (context) => AlertDialog(

          content: Container(
              constraints: BoxConstraints(
                maxWidth: 400,
                minWidth: 400,
                minHeight: 600,
                maxHeight: 600
              ),
              child: AddDoctor()),
        ),);
       // Navigator.of(context).pushNamed("/addDoctor");
      },
      child: Icon(Icons.add_a_photo_sharp),
    );
  }else if(index == 1){
    return FloatingActionButton(
      onPressed: (){
        showDialog(context: context, builder: (context) => AlertDialog(

          content: Container(
              constraints: BoxConstraints(
                  maxWidth: 400,
                  minWidth: 400,
                  minHeight: 600,
                  maxHeight: 600
              ),
              child: AddDepts()),
        ),);
        // Navigator.of(context).pushNamed("/addDoctor");
      },
      child: Icon(Icons.ac_unit_outlined),
    );
  }else{
    return FloatingActionButton(
      onPressed: (){},
      child: Icon(Icons.accessibility_outlined),
    );
  }
}
