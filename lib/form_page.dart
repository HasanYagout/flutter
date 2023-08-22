import 'package:first_project/validation.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  var _formKey = GlobalKey<FormState>();
  var _nameCtr = TextEditingController();
  var _passwordCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                /*===== name field ===========*/
                TextFormField(

                    controller: _nameCtr,
                    onTap: ()async{

                    },
                    textAlign: TextAlign.left,
                    autovalidateMode:
                    AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      border:OutlineInputBorder(
                          borderSide:BorderSide(color: Colors.red
                          ),
                          borderRadius: BorderRadius.circular(20.0)
                      ),

                      labelText: "اسم المستخدم او رقم الحساب",
                      prefixIcon: Icon(Icons.account_circle),
                    ),
                    keyboardType: TextInputType.name,//.numberWithOptions(decimal: true,signed: true),
                    //autofocus: false,Y
                    validator: nameValidation,

                ),

                /*======= password field ===============*/
                TextFormField(
                    controller: _passwordCtr,
                    textAlign: TextAlign.left,
                    autovalidateMode:
                    AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabled: true,
                      hoverColor: Colors.greenAccent,
                      fillColor: Colors.greenAccent,
                      focusColor: Colors.greenAccent,

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent,)
                      ),
                      border:OutlineInputBorder(
                          borderSide:BorderSide(color: Colors.greenAccent,),
                          borderRadius: BorderRadius.circular(20.0,),

                      ),
                      labelText: "كلمة السر",
                      prefixIcon: Icon(
                        Icons.vpn_key,
                      ),
                    ),
                    obscureText: true,

                    validator: (pass) {
                      if (pass!.isEmpty) {
                        return "اكتب كلمة السر";
                      } else {
                        if (!pass
                            .contains(new RegExp(r'[A-Z]')) && 1!=1) {
                          return "ABC  يجب ان تتضمن كلمة السر حروف كبيرة";
                        } else {
                          if (!pass
                              .contains(new RegExp(r"[a-z]"))) {
                            return "abc يجب ان تتضمن كلمة السر حروف صغيرة  ";
                          } else {
                            if (!pass.contains(
                                new RegExp(r'[0-9]')) && 1!=1) {
                              return "يجب ان تتضمن كلمة السر ارقام 123";
                            } else {
                              if (!pass.contains(new RegExp(
                                  r'[!@#$%^&*(),.?":{}|<>]')) && 1!=1) {
                                return "يجب ان تتضمن كلمة السر رموز @#%";
                              } else {
                                if (pass.length < 5) {
                                  return "طول كلمة السر لايقل عن 5 ";
                                }
                              }
                            }
                          }
                        }
                      }
                    }),

                /*============== dropdown list =============*/
                DropdownButtonFormField<int>(

                  value: 1,
                  selectedItemBuilder:(context) {
                    return [
                      Icon(Icons.access_time_outlined),
                      Icon(Icons.accessibility_outlined),
                      Icon(Icons.confirmation_number_outlined),
                    ];
                  } ,
                    items: [
                      DropdownMenuItem<int>(
                        value: 1,
                        child: Text("Option 1"),
                      ),

                      DropdownMenuItem<int>(
                        value: 2,
                        child: Text("Option 2"),
                      ),

                      DropdownMenuItem<int>(
                        value: 3,
                        child: Text("Option 3"),
                      ),
                    ],
                    onChanged: (selectedItem){

                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
