import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:fixhome2/screens/profile.dart';
import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Card,
        Color,
        Colors,
        IconButton,
        IconThemeData,
        Image,
        ListTile,
        MaterialPageRoute,
        Scaffold,
        State,
        StatefulWidget,
        Widget;
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  get globalswitchstatus => null;

  get SharedPreferences => null;

  get notificationon => null;

  set notificationon(notificationon) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar() ,
      drawer: MyDrawer(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 1.5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            //  mainAxisAlignment: MainAxisAlignment.,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print("HEre");
                                  AppSettings.openNotificationSettings();
                                  // AppSettings.openLocationSettings;
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.72,
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
                                  // color: Colors.black,
                                  alignment: Alignment.centerLeft,

                                  child: Text(
                                    "Turn notifications on/off",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: "crimson",
                                      color: Colors.pinkAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                              // Container(

                              // width: 43,
                              //   height: 70,
                              //   child: FlutterSwitch(
                              //     width: 43,
                              //     height: 23,
                              //     activeColor: Color(0xffFFFFFF),
                              //     inactiveColor: Color(0xffFFFFFF),
                              //     activeToggleColor: Color(0xffBE0F29),
                              //     inactiveToggleColor: Color(0xffBE0F29),
                              //     inactiveSwitchBorder: Border.all(
                              //       color: Colors.black,
                              //       width: 1.0,
                              //     ),
                              //     activeSwitchBorder: Border.all(
                              //       color: Colors.black,
                              //       width: 1.0,
                              //     ),
                              //     valueFontSize: 10.0,
                              //     toggleSize: 23.0,
                              //     value: notificationon,
                              //     borderRadius: 20.0,
                              //     // padding: 8.0,
                              //     inactiveText: "English",
                              //     activeText: "",
                              //     showOnOff: true,
                              //     onToggle: (val) async {
                              //       AppSettings.openNotificationSettings();

                              //       SharedPreferences prefs = await SharedPreferences.getInstance();

                              //       await prefs.setBool("appnotification", val);
                              //       // print(appnotification.toString());

                              //       print('here i am : $val');
                              //       notificationon = val;

                              //       Navigator.pushReplacement(context,
                              //         PageRouteBuilder(
                              //           pageBuilder: (context, animation1, animation2) => Setting(),
                              //           transitionDuration: Duration(seconds: 0),
                              //         ),
                              //       );
                              //     },
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: Mynav(),
    );
  }
}

class SharedPreferences {}
