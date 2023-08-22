import 'package:first_project/Providers/ItemProvider.dart';
import 'package:first_project/cart_page.dart';
import 'package:first_project/form_page.dart';
import 'package:first_project/grip.dart';
import 'package:first_project/list_page.dart';
import 'package:first_project/page_five.dart';
import 'package:first_project/page_four.dart';
import 'package:first_project/page_one.dart';
import 'package:first_project/page_three.dart';
import 'package:first_project/page_two.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemProvider>(create: (_)=>ItemProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter ',
        theme: ThemeData(
          //fontFamily: "Khebrat",
          fontFamily: "TestFF",
         // cardColor: Colors.greenAccent,
          /*elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.purple),

            )
          ),*/

          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.red,
          cardColor: Colors.greenAccent
        ),
        //home: const MyHomePage(title: 'Flutter ggggggggggg Home Page'),
       // home: PageThree(),
        initialRoute: "/list",
        routes: {
          "/one": (_)=> PageOne(),
          "/list": (_)=> ListPage(),
          "/two": (_)=> PageTwo(),
          "/three": (_)=> PageThree(),
          "/": (_)=> GridPage(),
          "/four": (_)=> PageFour(),
          "/form": (_)=> FormPage(),
          "/five": (_)=> PageFive(),
          "/cart": (_)=> CartPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("First App"),
        centerTitle: true,
       /* backgroundColor: Colors.green,*/
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_outlined)),
          Icon(Icons.add),
          Icon(Icons.accessibility_outlined),
        ],
      ),
      body: Center(
        child: Column(

          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

     mainAxisAlignment: MainAxisAlignment.center
          ,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),

            Text("Third")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
