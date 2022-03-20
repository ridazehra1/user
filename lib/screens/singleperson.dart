import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixhome2/Models/models.dart';
import 'package:fixhome2/screens/dilog.dart';
import 'package:fixhome2/screens/profile.dart';
import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:fixhome2/sharedwidget/floatig%20.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'chat.dart';

class Single extends StatefulWidget {
  var name, email, contact, cnic, image, serviceName;

  providerModel data;
  Single(
      {this.data,
      this.name,
      this.email,
      this.contact,
      this.cnic,
      this.serviceName,
      this.image});

  @override
  State<Single> createState() => _SingleState();
}

class _SingleState extends State<Single> {
  TextEditingController priceController = TextEditingController();

  TextEditingController comment = TextEditingController();

  String link = "http://www.fixhome.pk/examples/";

  Future<void> createOrder() async {
    final user = FirebaseAuth.instance.currentUser;
    final userCredentials = await FirebaseFirestore.instance
        .collection("Users")
        .doc(user.uid)
        .get();

    final url = Uri.parse("http://www.fixhome.pk/examples/test/confirm.php");
    final response = await http.post(url, body: {
      "Customer": userCredentials.data()["name"],
      "provider": widget.name,
      "service": widget.serviceName,
      "price": priceController.text,
      "datee": DateTime.now().toString(),
      "comment": comment.text,
    });
    comment.clear();
    priceController.clear();

    final data = json.decode(response.body);
    if (data == "Successfull") {
      Fluttertoast.showToast(
          msg: "Submitted Successfull",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  List<String> paagal = ["None", "Done", "Pending", "Cancel"];
  var _selectedLocation = "None";
  void showPopUp(BuildContext context) {
    String _selectedLocation;
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (ctx) => AlertDialog(
              backgroundColor: Colors.white,
              title: Text(''),
              content: SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width * 0.8,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                          controller: comment,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              hintText: 'Working Details',
                              hintStyle: TextStyle(
                                  fontSize: 20, color: Color(0xFFC2185B)),
                              labelText: "Nature of Work",
                              labelStyle: TextStyle(
                                  fontSize: 20, color: Color(0xFFC2185B)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Color(0xFFC2185B))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFC2185B))))),
                      SizedBox(
                        height: 9,
                      ),
                      TextField(
                          controller: priceController,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              hintText: 'Enter Price',
                              hintStyle: TextStyle(
                                  fontSize: 20, color: Color(0xFFC2185B)),
                              labelText: "Enter Price",
                              labelStyle: TextStyle(
                                  fontSize: 20, color: Color(0xFFC2185B)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Color(0xFFC2185B))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFC2185B))))),
                      // DropdownButton<String>(
                      //   value: _selectedLocation,
                      //   items: paagal.map((String location) {
                      //     return DropdownMenuItem<String>(
                      //       child: new Text(location),
                      //       value: location,
                      //     );
                      //   }).toList(),
                      //   onChanged: (String newValue) {
                      //     setState(() {
                      //       _selectedLocation = newValue;
                      //       print(_selectedLocation);
                      //     });
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel',
                      style: TextStyle(fontSize: 16, color: Colors.red)),

                  onPressed: () => Navigator.pop(context, true), // passing true

                  // onPressed: () {
                  //   Navigator.of(context).pop();
                  // },
                ),
                TextButton(
                  child: Text(
                    'Confirm',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  onPressed: () async {
                    // Navigator.of(context).pop();
                    await createOrder();
                  },
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
       appBar:AppBar() ,
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Container(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Color(0xFFC2185B), width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 8,
                            spreadRadius: 4,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.fromLTRB(2, 7, 0, 7),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Container(
                                      // height: 200,
                                      width: MediaQuery.of(context).size.width *
                                          0.20,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.20,
                                      child: Image.network(link + widget.image),
                                      // Container(
                                      //                         child: Text("HelpLine",

                                      //                             style: TextStyle(
                                      //                                 fontWeight: FontWeight.bold, fontSize: 20)),
                                      //                       ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20.0, top: 7.0),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 18.0),
                                      child: Center(
                                        child: Text(widget.serviceName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15)),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Container(
                                      child: Text(widget.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Container(
                                      child: Icon(
                                        Icons.add_moderator,
                                        color: Colors.amber.shade800,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: FlatButton(
                                    color: Colors.white,
                                    hoverColor: Colors.white,
                                    onPressed: () {
                                      launch("tel://" + widget.contact);

                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) {
                                      //       return Dilog();
                                      //     },
                                      //   ),
                                      // );
                                    },
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFC2185B),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Icon(
                                        FontAwesomeIcons.phoneAlt,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: FlatButton(
                                    color: Colors.white,
                                    hoverColor: Colors.white,
                                    onPressed: () {
                                      launch("sms://" + widget.contact);
                                    },
                                    // onPressed: () {
                                    // print('herllo');
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) {
                                    //       return ChatPage();
                                    // },
                                    // ),
                                    // );
                                    // },
                                    // ),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFC2185B),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Icon(
                                        FontAwesomeIcons.envelope,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            /////////////////////////confirm btnn
                            ///
                            Container(
                              alignment: Alignment.bottomCenter,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              child: RaisedButton(
                                onPressed: () {
                                  showPopUp(context);
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                textColor: Colors.white,
                                padding: const EdgeInsets.all(0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: size.height * 0.055,
                                  width: size.width * 0.3,
                                  decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      gradient: new LinearGradient(colors: [
                                        Color(0xFFC2185B),
                                        Color(0xFFC2185B)
                                      ])),
                                  padding: const EdgeInsets.all(0),
                                  child: Text(
                                    "Confirm",
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /////////////////////////////////////////////////////////////////////////////////////////////////
                    // SingleChildScrollView(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.all(25.0),
                    //         child: FlatButton(
                    //           color: Colors.white,
                    //           hoverColor: Colors.white,
                    //           onPressed: () {
                    //             // Navigator.push(
                    //             //   context,
                    //             //   MaterialPageRoute(
                    //             //     builder: (context) {
                    //             //       return Dilog();
                    //             //     },
                    //             //   ),
                    //             // );
                    //           },
                    //           child: Container(
                    //             height: 70,
                    //             width: 70,
                    //             decoration: BoxDecoration(
                    //               color: Color(0xFFC2185B),
                    //               borderRadius: BorderRadius.circular(100),
                    //             ),
                    //             child: Icon(
                    //               FontAwesomeIcons.phoneAlt,
                    //               color: Colors.white,
                    //               size: 30,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.all(25.0),
                    //         child: FlatButton(
                    //           color: Colors.white,
                    //           hoverColor: Colors.white,
                    //           onPressed: () {
                    //             Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                 builder: (context) {
                    //                   return ChatPage();
                    //                 },
                    //               ),
                    //             );
                    //           },
                    //           child: Container(
                    //             height: 70,
                    //             width: 70,
                    //             decoration: BoxDecoration(
                    //               color: Color(0xFFC2185B),
                    //               borderRadius: BorderRadius.circular(100),
                    //             ),
                    //             child: Icon(
                    //               FontAwesomeIcons.envelope,
                    //               color: Colors.white,
                    //               size: 30,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Center(
                    //   child: SingleChildScrollView(
                    //     child: Column(
                    //       children: [
                    //         Container(
                    //           alignment: Alignment.bottomCenter,
                    //           margin: EdgeInsets.symmetric(
                    //               horizontal: 40, vertical: 10),
                    //           child: RaisedButton(
                    //             onPressed: () {
                    //               showPopUp(context);
                    //             },
                    //             shape: RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.circular(80.0)),
                    //             textColor: Colors.white,
                    //             padding: const EdgeInsets.all(0),
                    //             child: Container(
                    //               alignment: Alignment.center,
                    //               height: 40.0,
                    //               width: size.width * 0.3,
                    //               decoration: new BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(10.0),
                    //                   gradient: new LinearGradient(colors: [
                    //                     Color(0xFFC2185B),
                    //                     Color(0xFFC2185B)
                    //                   ])),
                    //               padding: const EdgeInsets.all(0),
                    //               child: Text(
                    //                 "Confirm",
                    //                 textAlign: TextAlign.center,
                    //                 style:
                    //                     TextStyle(fontWeight: FontWeight.bold),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              // (ye nav ka secion hai)
            ),
          ),
        ),
      ),
      floatingActionButton: Floart(),
      bottomNavigationBar: Mynav(),
    );
  }
}
 

// price, service provider name, service provider serviceName, login customer name and current date
