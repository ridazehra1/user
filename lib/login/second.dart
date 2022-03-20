import 'package:flutter/material.dart';



// class MyApp1 extends StatelessWidget {
//   String value = "";
// MyApp1({this.value});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage1(),
//     );
//   }
// }

class MyHomePage1 extends StatefulWidget {
  String otp = "";
  MyHomePage1({this.otp});

  @override
  State<MyHomePage1> createState() => _MyHomePage1State(otp);
}

class _MyHomePage1State extends State<MyHomePage1> {
  String otp = "";
  _MyHomePage1State(this.otp);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
otp,

        ),
      ),
    );
  }
}
