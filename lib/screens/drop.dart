import 'package:flutter/material.dart';

class dropp extends StatefulWidget {
  const dropp({Key key}) : super(key: key);

  @override
  _droppState createState() => _droppState();
}

List<String> paagal = ["None", "Done", "Pending", "Cancel"];
var _selectedLocation = "None";

class _droppState extends State<dropp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
          value: _selectedLocation,
          items: paagal.map((String location) {
            return DropdownMenuItem<String>(
              child: new Text(location),
              value: location,
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              _selectedLocation = newValue;
              print(_selectedLocation);
            });
          },
        ),
      ),
    );
  }
}
