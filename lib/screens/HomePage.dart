import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixhome2/login/authentication.dart';
import 'package:fixhome2/login/login.dart';
import 'package:fixhome2/screens/body1.dart';
import 'package:fixhome2/screens/profile.dart';
import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:fixhome2/sharedwidget/floatig%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;
// var namee1;
curretndata() async {
  final userCredentials = await FirebaseFirestore.instance
      .collection("Users")
      .doc(auth.currentUser?.uid)
      .get();
  namee1 = userCredentials.data()["name"];
  print("object $namee1");
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    curretndata();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showDialog<bool>(
          context: context,
          builder: (c) => AlertDialog(
                title: Text('Warning'),
                content: Text('Do you really want to exit'),
                actions: [
                  FlatButton(
                      child: Text('Yes'),
                      onPressed: () async {
                        // final FirebaseAuth _auth = FirebaseAuth.instance;
                        // final GoogleSignIn _googleSignIn = GoogleSignIn();
                        // await _googleSignIn.signOut();
                        // await _auth.signOut();

                        // print('signout');
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => LoginScreen()));

                        SystemNavigator.pop();
                      }),
                  FlatButton(
                    child: Text('No'),
                    onPressed: () => Navigator.pop(c, false),
                  ),
                ],
              )),
      child: Scaffold(
        // (ye app bar hai)
        // appBar: AppBar(
        //   actions: [
        //     ElevatedButton(onPressed: curretndata, child: Text("data")),
        //   ],
        //   title: Text(" $name"),
        // ),

        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                googlee == true
                    ? "${auth.currentUser.email}"
                    : auth.currentUser.displayName,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.user,
                //Icon Size
                color: Colors.white, //Color Of Icon
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Profile();
                    },
                  ),
                );
              },
            ),
          ],
          backgroundColor: Color(0xFFC2185B),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),

        //  (ye drawer hai)
        drawer: MyDrawer(),
        body: Body1(),

        // (ye nav ka secion hai)

        floatingActionButton: Floart(),

        // (ye nav ka secion hai)
        //    floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        // floatingActionButton: Container(

        //   height: 60.0,
        //   width: 60.0,
        //   child: FittedBox(
        //     child:FloatingActionButton(backgroundColor:  Colors.orangeAccent,

        //   onPressed:(){ Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                       builder: (context) {
        //                         return MyHomePage ();
        //                       },
        //                     ),
        //                   ); },

        //   child: new Icon(Icons.home),
        // ),
        //   ),
        // ),
        // new FloatingActionButton(backgroundColor:  Colors.orangeAccent,

        //   onPressed:(){  },

        //   child: new Icon(Icons.home),
        // ),
        bottomNavigationBar: Mynav(),
      ),
    );
  }
}
