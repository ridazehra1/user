import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixhome2/login/login.dart';
import 'package:fixhome2/screens/HomePage.dart';

import 'package:fixhome2/screens/complain.dart';
import 'package:fixhome2/screens/helpline.dart';
import 'package:fixhome2/screens/orderhistory.dart';
import 'package:fixhome2/screens/profile.dart';
import 'package:fixhome2/screens/splistbody.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';

// import 'package:google_fonts/google_fonts.dart';
// import 'package:news/Bottomnav/tabspage.dart';
// import 'package:news/Bottomnav/tabspage2.dart';
// import 'package:news/Covid.dart/covid.dart';
// import 'package:news/DigitalStories/digitalstories.dart';
// import 'package:news/DigitalStories/digitalstoriesvideos.dart';
// import 'package:news/FakeNews/fakenews.dart';
// import 'package:news/Investigation/investigation.dart';
// import 'package:news/NewHome/dashboard.dart';
// import 'package:news/OPED/oped.dart';
// import 'package:news/Perspective/perspective.dart';
// import 'package:news/Search/new.dart';
// import 'package:news/Showbiz/showbiz_screen.dart';
// import 'package:news/Shows/shows.dart';
// import 'package:news/StockMarket/stockmarket.dart';
// import 'package:news/TabBar/latestnews.dart';
// import 'package:news/Viewall/viewall.dart';
// import 'package:news/Writer/writrers.dart';
// import 'package:news/connectwithus.dart';
// import 'package:news/delete.dart';
// import 'package:news/example.dart';
// import 'package:news/home.dart';
// import 'package:news/settings.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:news/sharedwidget/example.dart';
// import 'globals.dart';

var name;

class MyDrawer extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  get user => _auth.currentUser;
  // String name;
  Future signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();

    print('signout');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Image.asset(
                  "assets/logo.png",
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    // ListTile(
                    //   title: Text(
                    //     globalswitchstatus == false ? 'Example' : "ہوم",
                    //     style: TextStyle(
                    //         fontFamily: globalswitchstatus == false ? "Crimson" : "Mehr",
                    //         color: Colors.grey,
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.w500),
                    //   ),
                    //   onTap: () async {
                    //     // Navigator.pop(context);
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) {
                    //           return Example();
                    //         },
                    //       ),
                    //     );
                    //   },
                    // ),
                    ListTile(
                      title: Text(
                        'Home',
                        style: TextStyle(
                            fontFamily: "Crimson",
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      onTap: () async {
                        // Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MyHomePage();
                            },
                          ),
                        );
                      },
                    ),

                    // ListTile(
                    //   title: Text(
                    //     globalswitchstatus == false
                    //         ? 'LATEST NEWS'
                    //         : "تازہ ترین خبریں",
                    //     style:  TextStyle(
                    //         fontFamily: globalswitchstatus == false ? "Crimson" : "Mehr",
                    //         color: Colors.grey,
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.w500),
                    //   ),
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => ViewAll(
                    //                 screen: LatestNews(),
                    //                 engpagetitle: "Latest News",
                    //                 urdupagetitle: "تازہ ترین خبریں",
                    //                 urdunewsurl:
                    //                 "https://mmnews.tv/urdu/wp-json/wp/v2/posts?per_page=100&categories=241,243,244,245,242,3782,231,219,283,6029,6046,223,21725,6033,23524,20974,21913,285,21912,20973,3783,284,21735,10369,3781,9064,11233,1236,232,11385,3,17894,11437,222,1291,3784,12,230,4434,9292,282,20972,229,4218,17,14,1283,15885,15,21091,20975,1,13",
                    //                 engnewsurl:
                    //                 https://mmnews.tv/wp-json/wp/v2/posts?per_page=100&categories=241,243,244,245,242,3782,231,219,283,6029,6046,223,21725,6033,23524,20974,21913,285,21912,20973,3783,284,21735,10369,3781,9064,11233,1236,232,11385,3,17894,11437,222,1291,3784,12,230,4434,9292,282,20972,229,4218,17,14,1283,15885,15,21091,20975,1,13")));
                    //   },
                    // ),
                    //
                    // ListTile(
                    //   title: Text("Drop down",
                    //     style: TextStyle(
                    //         fontFamily: globalswitchstatus == false ? "Crimson" : "Mehr",
                    //         color: Colors.grey,
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.w500),
                    //   ),
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) {
                    //           return DropDown();
                    //         },
                    //       ),
                    //     );
                    //   },
                    // ),
                    ListTile(
                      title: Text(
                        'Profile',
                        style: TextStyle(
                            fontFamily: "Crimson",
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      onTap: () {
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

                    ListTile(
                      title: Text(
                        'Order History',
                        style: TextStyle(
                            fontFamily: "Crimson",
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return OrderHistory();
                            },
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Complain',
                        style: TextStyle(
                            fontFamily: "Crimson",
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Complain();
                            },
                          ),
                        );
                      },
                    ),

                    ListTile(
                        title: Text(
                          'Log Out',
                          style: TextStyle(
                              fontFamily: "Crimson",
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        onTap: () {
                          // googlee = false;
                          //SIGN OUT METHOD
                          signOut();
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  reverseDuration: Duration(seconds: 1),
                                  duration: Duration(seconds: 1),
                                  child: LoginScreen()));
                        }

                        // ListTile(
                        //   title: Text(
                        //     globalswitchstatus == false
                        //         ? 'Embed'
                        //         : "نقطہ نظر",
                        //     style: TextStyle(
                        //         fontFamily: globalswitchstatus == false ? "Crimson" : "Mehr",
                        //         color: Colors.grey,
                        //         fontSize: 18,
                        //         fontWeight: FontWeight.w500),
                        //   ),
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) {
                        //           return Embed();
                        //         },
                        //       ),
                        //     );
                        //   },
                        // ),
                        )
                  ],
                ),
              ],
            ),
          ),
          //Category
        ],
      ),
    );
  }
}
