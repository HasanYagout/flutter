import 'package:doctor/Controllers/account_provider.dart';
import 'package:doctor/Controllers/doctor_provider.dart';
import 'package:doctor/Models/DoctorModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _nameCtr = TextEditingController();

  TextEditingController _passwordCtr = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var doctorProvider = Provider.of<DoctorProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Login"), centerTitle: true,),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (n){
                    if(n!.isEmpty){
                      return "Please enter the name";
                    }
                    else if(n.length <3){
                      return "name must be more than 3 chars";
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _nameCtr,
                  onChanged: (v){
                    print("== Value: $v");
                  },
                  decoration: InputDecoration(
                    //  enabled: true,
                    hoverColor: Colors.yellow,
                    fillColor: Colors.cyan,
                    focusColor: Colors.greenAccent,

                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green,)
                    ),
                    border:OutlineInputBorder(
                      borderSide:BorderSide(color: Colors.blue,),
                      borderRadius: BorderRadius.circular(40.0,),

                    ),
                    labelText: "الاسم",
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordCtr,
                   obscureText: true,
                  decoration: InputDecoration(
                    //  enabled: true,
                    // hoverColor: Colors.greenAccent,
                    // fillColor: Colors.greenAccent,
                    // focusColor: Colors.greenAccent,

                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent,)
                    ),
                    border:OutlineInputBorder(
                      borderSide:BorderSide(color: Colors.white70,),
                      borderRadius: BorderRadius.circular(20.0,),

                    ),
                    labelText: "Id",
                    prefixIcon: Icon(
                      Icons.vpn_key,
                    ),
                  ),
                ),
              ),




            ],
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          var accProvider = Provider.of<AccountsProvider>(context,listen: false);
          try {
            if (_formKey.currentState!.validate()) {
              Map<String, dynamic> loginBody= {
                "email": _nameCtr.text,
                "password": _passwordCtr.text
              };
              var login = await accProvider.login(loginBody);
              var shared = await SharedPreferences.getInstance();
              shared.setString("token", login.token!);
              shared.setInt("userId", login.id!);
              shared.setString("image", login.image!);
              shared.setString("username", login.username!);

              /*if(_nameCtr.text == "user" && _passwordCtr.text == "12345"){
                var shared = await SharedPreferences.getInstance();
                shared.setBool("isDone", true);
                Navigator.of(context).pushReplacementNamed('/doctors');
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error! ")));
              }*/
              /*var data ={
                "Name": _nameCtr.text,
                "Password": int.parse(_passwordCtr.text),
              };*/
             // print("DATA: ${data}");

              }

            else{

            }
          } on Exception catch (e) {
            showDialog(context: context, builder: (context) => AlertDialog(
              content: Container(
                child: Text("${e.toString()}"),
              ),
            ),);
          }
        },

        child: Text("Send"),
      ),
      // bottomNavigationBar: BNB(currentIndex: 1),
    );
  }
}
