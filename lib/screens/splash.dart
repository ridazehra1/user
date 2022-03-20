import 'package:fixhome2/location.dart';
import 'package:fixhome2/login/login.dart';
import 'package:fixhome2/screens/HomePage.dart';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  // String notifcationtoken, deviceid;
  SplashScreen();
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // DeviceID (String thisid)
  // async {
  //
  //   var request = http.MultipartRequest('POST', Uri.parse('https://mmnews.tv/wp-json/user-data/notification'));
  //   request.fields.addAll({
  //     'notification_type': '1',
  //     'device_id': widget.devid,
  //     'notification_token': 'mfvk'
  //   });
  //
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //     print("Ye dev id ha");
  //     print(widget.devid);
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  //
  //
  // }

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>LoginScreen()
              // TabsPage()
              ));
      //  Navigator.push(
      //                   context,
      //                   PageTransition(
      //                       type: PageTransitionType.rotate,
      //                       child: LoginScreen()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38),
                    child: Image.asset("assets/logo.png"),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 130),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Copyright © 2021",
                        style: TextStyle(
                          fontFamily: "Crimson",
                          color: Color(0xff4B4B4B),
                          fontWeight: FontWeight.w500,
                          // fontSize: 13,
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          launch("http://www.fixhome.pk");
                        },
                        child: Text(
                          " Fixhome.pk ",
                          style: TextStyle(
                            fontFamily: "Crimson",
                            color: Color(0xff4B4B4B),
                            fontWeight: FontWeight.w500,
                            // fontSize: 13,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
