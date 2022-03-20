

import 'package:fixhome2/screens/HomePage.dart';
import 'package:fixhome2/screens/orderhistory.dart';
import 'package:fixhome2/screens/setting2.dart';
import 'package:fixhome2/sharedwidget/notification.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fixhome2/screens/profile.dart';
import 'package:flutter/material.dart';



class Mynav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFFC2185B),
          // borderRadius: const BorderRadius.only(
          //   topLeft: Radius.circular(40),
          //   topRight: Radius.circular(40),
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MyHomePage();
                              },
                            ),
                          );
                  
                }, 
                // icon: Icon(
                //   Icons.home_outlined,
                //   color: Colors.white,
                //   size: 35,
                // ),
           icon: Icon(FontAwesomeIcons.home,
   //Icon Size
    color: Colors.white, //Color Of Icon
)
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return OrderHistory ();
                              },
                            ),
                          );
                        },
                icon: Icon(
                  FontAwesomeIcons.tasks,
                  color: Colors.white,
                
                ),
              ),
              
            
                IconButton(
                enableFeedback: false,
                onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Notif2 ();
                              },
                            ),
                          );},
                icon: Icon(
                  FontAwesomeIcons.bell,
                  color: Colors.white,
                
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Setting ();
                              },
                            ),
                          );
                },
                icon: Icon(
                 FontAwesomeIcons.cogs,
                  color: Colors.white,
                
                ),
              ),
              
             
            ],
    
          ),
        ),
        
      ),
      
    );
    
  }
}
