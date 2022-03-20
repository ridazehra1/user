import 'dart:convert';

import 'package:fixhome2/Models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class userinfo extends StatelessWidget {
  // String? name;
  userModel data;
  userinfo(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userinfo1(data),
    );
  }
}

class userinfo1 extends StatefulWidget {
  userModel data;
  userinfo1(this.data);

  @override
  _userinfo1State createState() => _userinfo1State(data);
}

class _userinfo1State extends State<userinfo1> {
  userModel data;
  _userinfo1State(this.data);
  Future<void> pinti() async {
    var van = data.Id;
    String sp = van;
    print(sp);
    String url = "http://www.bcsportal.com.pk/test/provider.php";
    var response1 = await http.post(Uri.parse(url), body: {
      "service": sp,
    });
    var data1 = json.decode(response1.body);
    if (data1 == null) {
     
    } else { getProvider();}
  }

  String url1 = "http://www.bcsportal.com.pk/test/provider.php";

  getProvider() async {
    var response = await http.get(Uri.parse(url1));

    var resbody = json.decode(response.body);
    var spid = resbody[0]['service'];
    var van = data.Id;

    List<providerModel> prolist = [];
    if (spid == van) {
      for (var i in resbody) {
        providerModel users = providerModel(
            id: i["id"],
            profile: i["profile"],
            name: i["name"],
            cnic: i["cnic"],
            pass: i["pass"],
            contact: i["contact"],
            service: i["service"],
            location: i["location"],
            email: i["email"]);
        prolist.add(users);
        print(prolist);
      }
      return prolist;
    } else {
      print("no never");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.pinti();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data.Id,
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Container(height: 200, child: Image.network(data.image)),
        ],
      ),
    ));
  }
}
