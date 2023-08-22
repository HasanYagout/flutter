import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  onLoad()async{
    var shared = await SharedPreferences.getInstance();
    var isDone = shared.getBool("isDone");
    if(isDone != null){
      if(isDone){
        Navigator.of(context).pushReplacementNamed("/doctors");
      }
      else{
        Navigator.of(context).pushReplacementNamed("/login");
      }
    }
    else{
      Navigator.of(context).pushReplacementNamed("/login");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
      super.initState();
      onLoad();
  }
  @override
  void dispose() {
    // TODO: implement dispose
      super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
