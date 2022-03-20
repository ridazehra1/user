import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class Floart extends StatelessWidget {
  const Floart({Key key}) : super(key: key);

  void whatsAppOpen() async {
    // FlutterOpenWhatsapp.sendSingleMessage("918179015345", "Hello");
    String url = "whatsapp://send?phone=03218484070message=hello";
    await canLaunch(url) ? launch(url) : print("open whatsapp");
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      //Speed dial menu
      marginBottom: 12, //margin bottom
      child: Icon(Icons.dialpad_rounded), //icon on Floating action button
      activeIcon: Icons.close, //icon when menu is expanded on button
      backgroundColor: Colors.pink[700], //background color of button
      foregroundColor: Colors.white, //font color, icon color in button
      activeBackgroundColor:
          Colors.deepPurpleAccent, //background color when menu is expanded
      activeForegroundColor: Colors.white,
      buttonSize: 56.0, //button size
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'), // action when menu opens
      onClose: () => print('DIAL CLOSED'), //action when menu closes

      elevation: 15.0, //shadow elevation of button
      shape: CircleBorder(), //shape of button

      children: [
        SpeedDialChild(
          //speed dial child
          child: Icon(Icons.phone_android_sharp),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,

          onTap: () {
            launch("tel://03218484070");
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.message_outlined),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onTap: () {
            launch("sms://03218484070");
          },
        ),
        SpeedDialChild(
            child: Icon(
              FontAwesomeIcons.whatsapp,
              //Color Of Icon
            ),
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            onTap: () {
              whatsAppOpen();
            }),

        //add more menu item childs here
      ],
    );
  }
}
