// import 'dart:io';

// import 'package:fixhome2/Models/models.dart';
// import 'package:fixhome2/screens/HomePage.dart';
// import 'package:fixhome2/screens/profile.dart';
// import 'package:fixhome2/sharedwidget/bottomnav.dart';
// import 'package:fixhome2/sharedwidget/drawer.dart';
// import 'package:fixhome2/sharedwidget/floatig%20.dart';
// import 'package:fixhome2/sharedwidget/splist.dart';
// import 'package:flutter/material.dart';



// class SpListBody extends StatelessWidget {
//   const SpListBody({Key key}) : super(key: key);

//   get w800 => null;

//   get data => null;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold( backgroundColor: Color(0xFFE0E0E0),
//       appBar:AppBar(
     
//       actions: [
        
//       IconButton(
        
//         icon: Image.asset('assets/user.gif',height: 80,width: 80,),
//         onPressed: () {Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return Profile ();
//                             },
//                           ),
//                         );

//         },
//       ),
//     ],
//       backgroundColor: Color(0xFFC2185B),
//         iconTheme: IconThemeData(color: Colors.white,),
//     ) ,
//       drawer: MyDrawer(),
//       body:(),
//       // (ye nav ka secion hai)
//         floatingActionButton:Floart(),
//         bottomNavigationBar: Mynav(),
//       );

//   }
// }