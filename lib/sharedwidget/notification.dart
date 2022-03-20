import 'dart:io';

import 'package:fixhome2/screens/HomePage.dart';
import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:fixhome2/sharedwidget/floatig%20.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Notif2 extends StatelessWidget {
  // const Notif2({Key? key}) : super(key: key);

  get w800 => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
//     return DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Color(0xFFC2185B),
//             bottom: const TabBar(
//               tabs: [
//                 Tab(icon: Icon(Icons.directions_car)),
//                 Tab(icon: Icon(Icons.directions_transit)),
//                 Tab(icon: Icon(Icons.directions_bike)),
//               ],
//             ),
//             title: const Text('Tabs Demo'),
//           ),
//           body: const TabBarView(
//             children: [
//               Icon(Icons.directions_car),
//               Icon(Icons.directions_transit),
//               Icon(Icons.directions_bike),
//             ],
//           ),
//         ),

//     );
//   }
// }
    return Scaffold(
      backgroundColor: Color(0xFFE0E0E0),
      appBar: AppBar(
        
      ),
      drawer: MyDrawer(),
      body: Notif(),
      floatingActionButton: Floart(),
      bottomNavigationBar: Mynav(),
    );
  }
}

class Notif extends StatelessWidget {
  // const Notif({Key? key}) : super(key: key);

  get w800 => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: size.height * 0.12,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: ListTile(
                    title: Text(
                      "Alert notification",
                      maxLines: 1,
                      style: TextStyle(
                          letterSpacing: 1,
                          fontFamily: "crimson",
                          color: Color(0xFFC2185B),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top:3.0),
                      child: Text(
                          "Maintenance and repair service could be a broad term. A maintenance service agreement is then deemed to differ \naccording to an array of specifics depending on anyone who asks for it.",
                          maxLines: 2,
                          style: TextStyle(
                              fontFamily: "crimson",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              )),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.only (top:8.0),
                      child: Icon(
                        Icons.star,
                        color: Colors.amber.shade800,
                      ),
                    )
                    )),
          ),
        
      ],
    );
  }
}
