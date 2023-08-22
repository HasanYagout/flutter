import 'package:doctor/Controllers/depts_provider.dart';
import 'package:doctor/Views/add_dept.dart';
import 'package:doctor/Views/add_doctor.dart';
import 'package:doctor/Views/depts_page.dart';
import 'package:doctor/Views/doctors_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with SingleTickerProviderStateMixin{
  int currentIndex =0;
 //late TabController tabController;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
    child: Builder(
      builder: (context) {
        final TabController  tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if(!tabController.indexIsChanging){
            setState(() {
              print("************${tabController.index}");
              currentIndex = tabController.index;
              //tabController.notifyListeners();
            });

          }


        });
        return Scaffold(
          appBar: AppBar(
            title: Text("Tabs Page"),
            centerTitle: true,
            bottom: TabBar(
              //controller: tabController,
              isScrollable: false,
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
           // controller: tabController,
              clipBehavior: Clip.antiAliasWithSaveLayer,
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
        );
      }
    )
    );
  }
}

FloatingActionButton getBtn(int index, BuildContext context){
  if(index == 0){
    return FloatingActionButton(
      onPressed: ()async{
        var deptProvider = Provider.of<DeptsProvider>(context, listen: false);
        deptProvider.setDepts();
        var depts = deptProvider.depts;
        showDialog(context: context, builder: (context) => AlertDialog(

          content: Container(
              constraints: BoxConstraints(
                maxWidth: 400,
                minWidth: 400,
                minHeight: 600,
                maxHeight: 600
              ),
              child: AddDoctor(depts: depts,)),
        ),);
       // Navigator.of(context).pushNamed("/addDoctor");
      },
      child: Icon(Icons.add_a_photo_sharp),
    );
  }else if(index == 1){
    return FloatingActionButton(
      onPressed: ()async{

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
