
import 'package:doctor/Controllers/doctor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class DoctorsPage extends StatefulWidget {
  const DoctorsPage({Key? key}) : super(key: key);

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  int currentIndex =1;

  @override
  Widget build(BuildContext context) {
    var doctorProvider = Provider.of<DoctorProvider>(context);
    doctorProvider.setDoctors();
    return Scaffold(
      appBar: AppBar(title: Text("List Page",),centerTitle: true,
        actions: [

          GestureDetector(child: Icon(Icons.power_settings_new_outlined),
            onTap: ()async{
              var shared = await SharedPreferences.getInstance();
              shared.setBool("isDone", false);
              Navigator.of(context).pushReplacementNamed("/login");

            },
          ),
          SizedBox(width: 20,),
          //Center(child: Text("${itemProvider.cartItems.length}")),
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
              itemCount: doctorProvider.doctors.length,
              itemBuilder: (context, index){
                return Container(
                  child: ListTile(
                    onTap: (){
                      // print("Im in Item number: ${sList[index]}");
                    },
                    leading: CircleAvatar(
                      child: Image.asset("assets/images/${doctorProvider.doctors[index].img}",
                          fit: BoxFit.contain),
                    ),
                    trailing: IconButton(icon: Icon(Icons.add),
                      onPressed: (){
                        // itemProvider.DeleteItem(index);
                      //  itemProvider.AddToCart(index);
                      },
                    ),
                    title: Text(doctorProvider.doctors[index].name!),
                  ),
                );
              }),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pushNamed("/addDoctor");
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
