import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixhome2/compnent/services.dart';
import 'package:fixhome2/screens/HomePage.dart';
import 'package:fixhome2/screens/profile.dart';
import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:fixhome2/sharedwidget/floatig%20.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  void initState() {
    this.getList();
  }

  List list = [];
  getList() async {
    final user = FirebaseAuth.instance.currentUser;
    final userCredentials = await FirebaseFirestore.instance
        .collection("Users")
        .doc(user.uid)
        .get();

    final url = Uri.parse('http://www.fixhome.pk/examples/test/order.php');

    http.Response response = await http.get(url);

    var obj = json.decode(response.body);
    print(obj);
    if (response.statusCode == 200 || response.statusCode == 400) {
      for (int i = 0; i < obj.length; i++) {
        if (obj[i]['name'] == userCredentials.data()["name"]) {
          list.add({
            'name': obj[i]['name'],

            'provider': obj[i]['provider'],
            'service': obj[i]['service'],
            'date': obj[i]['date'],
            'price': obj[i]['price'],
            'comment': obj[i]['comment'],
            // 'contact': obj[i]['contact'],
          });
        }
      }
    }
    print(list);
    setState(() {});
  }

  var currentuser;
  get w800 => null;

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      floatingActionButton: Floart(),
      bottomNavigationBar: Mynav(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: heightScreen * 0.9,
          width: widthScreen,
          child: list.isNotEmpty
              ? ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                        height: heightScreen * 0.14,
                        width: widthScreen,
                        // child: InkWell(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => Single(
                        //                   name: list[index]['name'],
                        //                   image: list[index]['image'],
                        //                   cnic: list[index]['cnic'],
                        //                   email: list[index]['email'],
                        //                   contact: list[index]['contact'],
                        //                   serviceName: list[index]
                        //                       ['service_name'],
                        //                 )));
                        //   },
                        child: CustomCard(
                          borderRadius: 30,
                          height: MediaQuery.of(context).size.height * 0.14,
                          width: MediaQuery.of(context).size.width * 0.85,
                          elevation: 10,
                          childPadding: 3,
                          color: Colors.white,
                          borderColor: Colors.grey.shade500,
                          borderWidth: 2,
                          hoverColor: Colors.pink.shade50,
                          // elevation: 2.0,
                          // shadowColor: Colors.pink[600],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child:
                                // Image.network(
                                //   "${link + list[index]['image']}",
                                //   width: widthScreen * 0.18,
                                // ),
                                Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        list[index]['service'],
                                        style: TextStyle(
                                            color: Color(0xFFC2185B),
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "PKR ${list[index]['price']}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        list[index]["comment"],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          list[index]["provider"],
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 38),
                                          child: Text(
                                            list[index]['date'],
                                            style: TextStyle(
                                                color: Color(0xFFC2185B),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                  })
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
