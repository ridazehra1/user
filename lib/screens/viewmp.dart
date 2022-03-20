import 'dart:io';

import 'package:fixhome2/screens/HomePage.dart';
import 'package:fixhome2/screens/profile.dart';
import 'package:fixhome2/screens/splistbody.dart';

import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:fixhome2/sharedwidget/floatig%20.dart';

import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';


class MyBd1 extends StatelessWidget {
  const MyBd1({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // (ye app bar hai)
     appBar:AppBar(
     
      actions: [
        
      IconButton(
        
        icon: Image.asset('assets/user.gif',height: 80,width: 80,),
        onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Profile ();
                            },
                          ),
                        );

        },
      ),
    ],
      backgroundColor: Color(0xFFC2185B),
        iconTheme: IconThemeData(color: Colors.white,),
    ) ,
        //  (ye drawer hai)
        drawer:MyDrawer(),
        body:Viewmp(),
        
        bottomNavigationBar: Mynav(),

    );
  }
}

// class Viewmp extends StatelessWidget {
//   const Viewmp({Key key}) : super(key: key);

//   get w800 => null;
class Viewmp  extends StatefulWidget {
  const Viewmp ({ Key key }) : super(key: key);

  @override
  _ViewmpState createState() => _ViewmpState();
}

class _ViewmpState extends State<Viewmp> {







  
  @override
  Widget build(BuildContext context) {
            Size size = MediaQuery.of(context).size;
    String locationMassage;
    return Scaffold(
      appBar:AppBar(
     
      actions: [
        
      IconButton(
        
        icon: Image.asset('assets/user.gif',height: 80,width: 80,),
        onPressed: () => exit(0),
      ),
    ],
      backgroundColor: Color(0xFFC2185B),
        iconTheme: IconThemeData(color: Colors.white,),
    ) ,
     drawer:MyDrawer(),
    body:Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         
         
         children: [
Icon(Icons.location_on,
size:46.0,
color: Colors.blue,
),
SizedBox(height: 10.0,),
Text("get your location"),
SizedBox(height: 20.0,),



FlatButton(onPressed:(){},
color: Colors.blue,
child: Text("get your location"),
)

       ],),
     ),
    //  body: Padding(
    //    padding: const EdgeInsets.only(bottom:15.0),
    //    child: Container(
    //               alignment: Alignment.bottomCenter,
                  
    //               child: RaisedButton(
    //                 onPressed: () {
    //                   // login();
    //                   // login();
    //                   Navigator.push(
    //                       context,
    //                       PageTransition(
    //                           type: PageTransitionType.rightToLeft,
    //                           reverseDuration: Duration(seconds: 1),
    //                           duration: Duration(seconds: 1),
    //                           child: SpListBody()));
    //                 },
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(80.0)),
    //                 textColor: Colors.white,
    //                 padding: const EdgeInsets.all(0),
    //                 child: Container(
    //                   alignment: Alignment.center,
    //                   height: 40.0,
    //                   width: size.width * 0.3,
    //                   decoration: new BoxDecoration(
    //                       borderRadius: BorderRadius.circular(10.0),
    //                       gradient: new LinearGradient(
    //                           colors: [Color(0xFFC2185B), Color(0xFFC2185B)])),
    //                   padding: const EdgeInsets.all(0),
    //                   child: Text(
    //                     "View List",
    //                     textAlign: TextAlign.center,
    //                     style: TextStyle(fontWeight: FontWeight.bold),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //  ),
         
        // (ye nav ka secion hai)
         
      floatingActionButton: Floart(),
       bottomNavigationBar: Mynav(),
      
    );
    
  }
}
