
import 'package:fixhome2/screens/HomePage.dart';
import 'package:fixhome2/screens/profile.dart';
import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:fixhome2/sharedwidget/floatig%20.dart';
import 'package:flutter/material.dart';

class Dilog extends StatefulWidget {
  const Dilog({ Key key }) : super(key: key);

  @override
  _DilogState createState() => _DilogState();
}

class _DilogState extends State<Dilog> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AlertDialog(
        backgroundColor: Colors.grey.shade300,
        title: Text('Thank You'),
        content: Text('your Confirmation Has een Done'),
        actions: [
          FlatButton(
            textColor: Colors.black,
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
            child: Text('CANCEL'),
          ),
          FlatButton(
            textColor: Colors.black,
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
            child: Text('ACCEPT'),
          ),
        ],
      ),
    );
  }
}