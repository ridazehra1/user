// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:fixhome2/Models/models.dart';
import 'package:http/http.dart' as http;

String url = "http://www.fixhome.pk/examples/test/service.php";
String url1 = "http://www.fixhome.pk/examples/test/provider.php";
String url2 = "http://www.fixhome.pk/examples/test/order.php";

getUser() async {
  var response = await http.get(Uri.parse(url));
  var resbody = json.decode(response.body);
  List<userModel> userlist = [];
  for (var i in resbody) {
    userModel users =
        userModel(Id: i["Id"], image: i["image"], name: i["name"]);
    userlist.add(users);
  }
  return userlist;
}

getProvider() async {
  var response = await http.get(Uri.parse(url1));
  var resbody = json.decode(response.body);
  List<providerModel> prolist = [];
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
  }
  return prolist;
}

getOrder() async {
  var response1 = await http.get(Uri.parse(url2));
  var resbody1 = json.decode(response1.body);
  List<orderModel> orderlist = [];
  for (var i in resbody1) {
    orderModel users1 = orderModel(
        id: i["Id"],
        service: i["service"],
        name: i["name"],
        price: i["price"],
        date: i["date"],
        provider: i['provider']);
    orderlist.add(users1);
    print("ye" + orderlist.length.toString());
  }
  return orderlist;
}
