import 'package:doctor/Controllers/doctor_provider.dart';
import 'package:doctor/Models/DoctorModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class AddDoctor extends StatefulWidget {
  const AddDoctor({Key? key}) : super(key: key);

  @override
  State<AddDoctor> createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  TextEditingController _nameCtr = TextEditingController();

  TextEditingController _idCtr = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var doctorProvider = Provider.of<DoctorProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Add Doctor"), centerTitle: true,),
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
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _idCtr,
                  // obscureText: true,
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
          if (_formKey.currentState!.validate()) {

            var data ={
              "Name": _nameCtr.text,
              "Id": int.parse(_idCtr.text),
              "DeptId": 1,
              "Img": "1.jpg"
            };
            print("DATA: ${data}");
            var dr = DoctorModel.fromJson(data);
            var isDone= await doctorProvider.addDoctor(dr);
            if(isDone){
              showDialog(context: context, builder: (context) {
                return Container(
                  constraints: BoxConstraints(
                      maxHeight: 100,
                      minHeight: 100,
                      minWidth: 150,
                      maxWidth: 150
                  ),
                  child: AlertDialog(
                    title: Text("Success"),
                    content: Center(
                      child: Container(


                        child: Text("تمت الاضافة بنجاح"),
                      ),
                    ),
                  ),
                );
              },);
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            }
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
     // bottomNavigationBar: BNB(currentIndex: 1),
    );
  }
}
