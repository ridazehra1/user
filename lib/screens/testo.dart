import 'package:fixhome2/Models/models.dart';
import 'package:flutter/material.dart';
class Check extends StatefulWidget {
   userModel data;
  Check(this.data);

  @override
  _CheckState createState() => _CheckState(data);
}

class _CheckState extends State<Check> {
     userModel data;
  _CheckState(this.data);
  @override
  Widget build(BuildContext context) {
 return Scaffold(
      body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          data.name,
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        Container(height: 200, child: Image.network(data.image)),
      ],
    ),
  ));
  }
}