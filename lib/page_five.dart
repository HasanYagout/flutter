import 'package:flutter/material.dart';

import 'bnb.dart';

class PageFive extends StatefulWidget {
  const PageFive({Key? key}) : super(key: key);

  @override
  State<PageFive> createState() => _PageFiveState();
}

class _PageFiveState extends State<PageFive> {
  TextEditingController _nameCtr = TextEditingController();
  bool? chk = false;
  DateTime date = DateTime.now();
  TextEditingController _passwordCtr = TextEditingController();
  TextEditingController _detailsCtr = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Five - Form"), centerTitle: true,),
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
                    labelText: "كلمة السر",
                    prefixIcon: Icon(
                      Icons.vpn_key,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _detailsCtr,

                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent,)
                    ),
                    border:OutlineInputBorder(
                      borderSide:BorderSide(color: Colors.greenAccent,),
                      borderRadius: BorderRadius.circular(20.0,),

                    ),
                    labelText: "التفاصيل",
                    prefixIcon: Icon(
                      Icons.info_outline,
                    ),
                  ),
                ),
              ),
              Checkbox(value: chk, onChanged: (v){

                setState(() {
                  chk= v;
                });
              }),

              ElevatedButton(onPressed: ()async{
               var dt =await showDatePicker(
                    context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 36000)),

                );
               date = dt!;
              }, child: Text("Choose Date"))

            ],
        ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if (_formKey.currentState!.validate()) {
            print("Name: ${_nameCtr.text}");
            print("Password: ${_passwordCtr.text}");
            print("Details: ${_detailsCtr.text}");
            print("is Checked: ${chk}");
            print("Date : ${date}");
          }
          else{
            showDialog(
              context: context,
              builder: (context) => AlertDialog(title: Text("error")),);

            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Check form data"),
                  backgroundColor: Colors.red,));
          }
        },

       child: Text("Send"),
      ),
      bottomNavigationBar: BNB(currentIndex: 1),
    );
  }
}
