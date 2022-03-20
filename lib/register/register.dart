// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:fixhome2/login/component/background.dart';
// import 'package:fixhome2/login/login.dart';
// import 'package:fixhome2/login/otp.dart';
// import 'package:geolocator/geolocator.dart';
// // import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:page_transition/page_transition.dart';

// class RegisterScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: MyRegister(),
//     );
//   }
// }

// class MyRegister extends StatefulWidget {
//   @override
//   _MyRegisterState createState() => _MyRegisterState();
// }

// class _MyRegisterState extends State<MyRegister> {
//   String value = "";
//   // void getcurrent() async {
//   //   var position = await GeolocatorPlatform.instance. getCurrentPosition(locationSettings: );
//   // }
//   final auth = FirebaseAuth.instance;

//   userStore() async {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     String uid = await auth.currentUser.uid;

//     try {
//       await db.collection("Users").doc(uid).set({
//         "name": name.text,
//         "email": email.text,
//         "phone": phone.text,
//         "password": pass.text
//       });
//       print("User is register");
//     } catch (e) {
//       print("ERROR");
//     }
//   }

//   final databaseref = FirebaseDatabase.instance.ref();
//   String emaill = '';
//   String password = '';
//   var location;

//   TextEditingController name = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController phone = TextEditingController();
//   TextEditingController pass = TextEditingController();

//   void getLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }

//     print(await Geolocator.getCurrentPosition());
//     location = await Geolocator.getCurrentPosition();
//   }

//   @override
//   void initState() {
//     getLocation();
//     super.initState();
//   }

//   void insertData(String name, String email, String phone, String pass) {
//     databaseref.child("users").set({
//       'name': name,
//       'email': email,
//       'phone': phone,
//       'pass': pass,
//       'location': location.toString(),
//     });
//   }

//   Future register() async {
//     print('location here');
//     print(location.toString());

//     String url = "http://www.fixhome.pk/examples/test/signup.php";
//     var response = await http.post(Uri.parse(url), body: {
//       "name": name.text,
//       "password": pass.text,
//       "email": email.text,
//       "phoneno": phone.text,
//       "location": location.toString(),
//     });
//     name.clear();
//     email.clear();
//     pass.clear();
//     phone.clear();
//     var data = json.decode(response.body);
//     if (data == "Error") {
//       Fluttertoast.showToast(
//           msg: "User Already Exist",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//     } else {
//       Fluttertoast.showToast(
//           msg: "Successfull",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//     }
//   }

//   bool _isObscure = true;
//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//     Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       // appBar: new AppBar(
//       //   backgroundColor: Colors.white,
//       //   leading: new IconButton(
//       //     icon: new Icon(Icons.arrow_back,
//       //     color: Colors.black,
//       //     ),
//       //     onPressed: () {
//       //       Navigator.push(
//       //         context,
//       //         MaterialPageRoute(builder: (context) => LoginScreen()),
//       //       );
//       //     },
//       //   ),
//       // ),
//       body: Background(
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(height: size.height * 0.03),
//                 // Image.asset("assets/A.png"),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: Container(
//                     alignment: Alignment.center,

//                     // child: Image.asset("assets/logo.png", width: size.width * 0.45),
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: .0),
//                       child: Text("Registered Now",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFFC2185B),
//                           )),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: size.height * 0.03),
//                 Container(
//                     alignment: Alignment.center,
//                     width: 300,
//                     height: 50,
//                     margin: EdgeInsets.symmetric(horizontal: 40),
//                     child: TextFormField(
//                       autofocus: true,
//                       onChanged: (value) {
//                         password = value;
//                       },
//                       decoration: InputDecoration(
//                         hintText: "Enter Name",
//                         labelStyle: TextStyle(color: Colors.blue.shade700),
//                         icon: Icon(
//                           Icons.person,
//                           color: Color(0xFFC2185B),
//                         ),
//                         fillColor: Colors.blue.shade700,
//                         focusedBorder: OutlineInputBorder(
//                           borderSide:
//                               const BorderSide(color: Colors.blue, width: 2.0),
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                       ),
//                       controller: name,
//                     )),
//                 SizedBox(height: size.height * 0.01),
//                 Container(
//                     alignment: Alignment.center,
//                     width: 300,
//                     height: 50,
//                     margin: EdgeInsets.symmetric(horizontal: 40),
//                     child: TextFormField(
//                       onChanged: (value) {
//                         password = value;
//                       },
//                       decoration: InputDecoration(
//                         hintText: "Enter Email",
//                         labelStyle: TextStyle(
//                           color: Color(0xFFC2185B),
//                         ),
//                         icon: Icon(
//                           Icons.email,
//                           color: Color(0xFFC2185B),
//                         ),
//                         fillColor: Colors.blue.shade700,
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                               color: Color(0xFFC2185B), width: 2.0),
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                       ),
//                       controller: email,
//                     )),
//                 SizedBox(height: size.height * 0.01),
//                 Container(
//                     alignment: Alignment.center,
//                     width: 300,
//                     height: 50,
//                     margin: EdgeInsets.symmetric(horizontal: 40),
//                     child: TextFormField(
//                       onChanged: (value) {
//                         password = value;
//                       },
//                       decoration: InputDecoration(
//                         hintText: "Enter Phone",
//                         labelStyle: TextStyle(
//                           color: Color(0xFFC2185B),
//                         ),
//                         icon: Icon(
//                           Icons.phone,
//                           color: Color(0xFFC2185B),
//                         ),
//                         fillColor: Color(0xFFC2185B),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                               color: Color(0xFFC2185B), width: 2.0),
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                       ),
//                       controller: phone,
//                     )),
//                 SizedBox(height: size.height * 0.01),
//                 // Container(
//                 //     alignment: Alignment.center,
//                 //     width: 300,
//                 //     height: 50,
//                 //     margin: EdgeInsets.symmetric(horizontal: 40),
//                 //     child: TextFormField(
//                 //       onChanged: (value) {
//                 //         password = value;
//                 //       },
//                 //       decoration: InputDecoration(
//                 //         hintText: "Enter Cnic no.",
//                 //         labelStyle: TextStyle(color: Colors.blue.shade700),
//                 //         icon: Icon(
//                 //           Icons.card_membership_sharp,
//                 //           color: Colors.blue.shade700,
//                 //         ),
//                 //         fillColor: Colors.blue.shade700,
//                 //         focusedBorder: OutlineInputBorder(
//                 //           borderSide:
//                 //               const BorderSide(color: Colors.blue, width: 2.0),
//                 //           borderRadius: BorderRadius.circular(15.0),
//                 //         ),
//                 //       ),
//                 //       controller: cnic,
//                 //     )),
//                 SizedBox(height: size.height * 0.01),
//                 Container(
//                     alignment: Alignment.center,
//                     width: 300,
//                     height: 50,
//                     margin: EdgeInsets.symmetric(horizontal: 40),
//                     child: TextFormField(
//                       //obscureText: true,
//                       obscureText: _isObscure,
//                       onChanged: (value) {
//                         password = value;
//                       },
//                       decoration: InputDecoration(
//                         suffixIcon: IconButton(
//                           icon: Icon(_isObscure
//                               ? Icons.visibility
//                               : Icons.visibility_off),
//                           onPressed: () {
//                             setState(() {
//                               _isObscure = !_isObscure;
//                             });
//                           },
//                         ),
//                         hintText: "Enter Password",
//                         labelStyle: TextStyle(
//                           color: Color(0xFFC2185B),
//                         ),
//                         icon: Icon(
//                           Icons.password_rounded,
//                           color: Color(0xFFC2185B),
//                         ),
//                         fillColor: Color(0xFFC2185B),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                               color: Color(0xFFC2185B), width: 2.0),
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                       ),
//                       controller: pass,
//                     )),
//                 SizedBox(height: size.height * 0.01),
//                 // Padding(
//                 //   padding: const EdgeInsets.symmetric(horizontal: 70),
//                 //   child: Container(
//                 //     child: DropdownButton(
//                 //       hint: Text("Select Service"),
//                 //       isExpanded: true,
//                 //       iconEnabledColor: Colors.blue.shade700,
//                 //       items: data.map((item) {
//                 //         return DropdownMenuItem(
//                 //           child: Row(
//                 //             children: [
//                 //               Icon(
//                 //                 Icons.settings,
//                 //                 color: Colors.blue.shade700,
//                 //               ),
//                 //               Padding(
//                 //                 padding: const EdgeInsets.only(left: 18.0),
//                 //                 child: Text(
//                 //                   item['name'],
//                 //                   style: TextStyle(color: Colors.blue),
//                 //                 ),
//                 //               ),
//                 //             ],
//                 //           ),
//                 //           value: item['Id'].toString(),
//                 //         );
//                 //       }).toList(),
//                 //       onChanged: (newVal) {
//                 //         setState(() {
//                 //           _mySelection = newVal;
//                 //           print(_mySelection);
//                 //         });
//                 //       },
//                 //       value: _mySelection,
//                 //     ),
//                 //   ),
//                 // ),
//                 SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Container(
//                         alignment: Alignment.center,
//                         margin:
//                             EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//                         child: RaisedButton(
//                           onPressed: () async {
//                             _formKey.currentState.validate();
//                             await auth.createUserWithEmailAndPassword(
//                                 email: email.text, password: pass.text);
//                             userStore();
//                             register();
//                             setState(() {
//                               // _determinePosition();
//                             });
//                             // insertData(
//                             //     name.text, email.text, phone.text, pass.text);
//                             Navigator.push(
//                                 context,
//                                 PageTransition(
//                                     type: PageTransitionType.rightToLeft,
//                                     reverseDuration: Duration(seconds: 1),
//                                     duration: Duration(seconds: 1),
//                                     child: MyOtp(value: value)));
//                           },
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(80.0)),
//                           textColor: Colors.white,
//                           padding: const EdgeInsets.all(0),
//                           child: Container(
//                             alignment: Alignment.center,
//                             height: 40.0,
//                             width: size.width * 0.3,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.0),
//                               color: Color(0xFFC2185B),
//                             ),
//                             padding: const EdgeInsets.all(0),
//                             child: Text(
//                               "SIGNUP",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.center,
//                   margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//                   child: GestureDetector(
//                     onTap: () => {
//                       Navigator.push(
//                           context,
//                           PageTransition(
//                               type: PageTransitionType.rightToLeft,
//                               reverseDuration: Duration(seconds: 1),
//                               duration: Duration(seconds: 1),
//                               child: LoginScreen()))
//                     },
//                     child: Text(
//                       "Already Have Account ? Signin",
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFFC2185B),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

////////////////////////new Code
///
import 'dart:convert';
import 'package:fixhome2/login/component/background.dart';
import 'package:fixhome2/login/login.dart';
import 'package:fixhome2/login/otp.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fixhome2/login/component/background.dart';
// import 'package:fixhome2/login/login.dart';
// import 'package:fixhome2/login/otp.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:page_transition/page_transition.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MyRegister(),
    );
  }
}

class MyRegister extends StatefulWidget {
  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  String value = "";
  // void getcurrent() async {
  //   var position = await GeolocatorPlatform.instance. getCurrentPosition(locationSettings: );
  // }
  static final auth = FirebaseAuth.instance;

  String emaill = '';
  String password = '';

// Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  // final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  // final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.token);

  // Once signed in, return the UserCredential
  // return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
// }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cnic = TextEditingController();
  TextEditingController service = TextEditingController();

  Future<Position> _location() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      long = position.longitude;
      lat = position.latitude;
      print("longitude $long");
      print("latitude $lat ");

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      return await Geolocator.getCurrentPosition();
    } catch (e) {
      print(e.toString());
    }
  }

  var long;
  var lat;

  // String _mySelection;

  // final String url = "http://www.fixhome.pk/examples/test/service.php";

  // List data = []; //edited line

  // Future<String> getSWData() async {
  //   // var res = await http
  //   //     .get(Uri.encodeFull(url), );
  //   // var resBody = json.decode(res.body);
  //   var response1 = await http.get(Uri.parse(url));
  //   var resBody = json.decode(response1.body);
  //   setState(() {
  //     data = resBody;
  //   });

  //   print(resBody);

  //   return "Sucess";
  // }

  @override
  void initState() {
    super.initState();
    this._location();
    // this.getSWData();
  }

  userStore() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    String uid = await auth.currentUser.uid;

    try {
      await db.collection("Users").doc(uid).set({
        "name": name.text,
        "email": "${email.text}@gmail.com",
        "phone": phone.text,
        "password": pass.text,
        // "service": _mySelection,
        // "cnic": cnic.text,
        "lat": await lat.toString(),
        "long": long.toString()
      });
      print("User is register");
    } catch (e) {
      print("ERROR");
    }
  }

  Future register() async {
    print('location here');
    print(lat.toString());
    print(long.toString());
    try {
      String url = "http://www.fixhome.pk/examples/test/signup.php";
      var response = await http.post(Uri.parse(url), body: {
        "name": name.text,
        "password": pass.text,
        "email": email.text,
        "phoneno": phone.text,
        "lat": lat.toString(),
        "long": long.toString()
      });
      print("okkkkk" + response.body);
      var data = json.decode(response.body);
      print("okkkkk" + data);
      if (data == "Error") {
        Fluttertoast.showToast(
            msg: "User Already Exist",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Successfull",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   @override
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // ignore: unnecessary_new
      // appBar: new AppBar(
      //   toolbarHeight: 130,
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   title: Image.asset(
      //     "assets/register.png",
      //     width: 100,
      //     height: 120,
      //   ),
      // ),
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.03),
                // Image.asset("assets/A.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    alignment: Alignment.center,

                    // child: Image.asset("assets/logo.png", width: size.width * 0.45),
                    child: Padding(
                      padding: const EdgeInsets.only(top: .0),
                      child: Text("Registered Now",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                    alignment: Alignment.center,
                    width: size.width * 0.70,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Name",
                        labelStyle: TextStyle(
                          color: Color(0xFFC2185B),
                        ),
                        icon: Icon(
                          Icons.person,
                          color: Color(0xFFC2185B),
                        ),
                        fillColor: Color(0xFFC2185B),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFC2185B), width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      controller: name,
                    )),
                SizedBox(height: size.height * 0.03),
                Container(
                    alignment: Alignment.center,
                    width: size.width * 0.70,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter User Name",
                        labelStyle: TextStyle(
                          color: Color(0xFFC2185B),
                        ),
                        icon: Icon(
                          Icons.email,
                          color: Color(0xFFC2185B),
                        ),
                        fillColor: Color(0xFFC2185B),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFC2185B), width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      controller: email,
                    )),
                SizedBox(height: size.height * 0.03),
                Container(
                    alignment: Alignment.center,
                    width: size.width * 0.70,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Phone",
                        labelStyle: TextStyle(
                          color: Color(0xFFC2185B),
                        ),
                        icon: Icon(
                          Icons.phone,
                          color: Color(0xFFC2185B),
                        ),
                        fillColor: Color(0xFFC2185B),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFC2185B), width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      controller: phone,
                    )),
                // SizedBox(height: size.height * 0.01),
                // Container(
                //     alignment: Alignment.center,
                //     width: 300,
                //     height: 50,
                //     margin: EdgeInsets.symmetric(horizontal: 40),
                //     child: TextFormField(
                //       onChanged: (value) {
                //         password = value;
                //       },
                //       decoration: InputDecoration(
                //         hintText: "Enter Cnic no.",
                //         labelStyle: TextStyle(color: Colors.blue.shade700),
                //         icon: Icon(
                //           Icons.card_membership_sharp,
                //           color: Colors.blue.shade700,
                //         ),
                //         fillColor: Colors.blue.shade700,
                //         focusedBorder: OutlineInputBorder(
                //           borderSide:
                //               const BorderSide(color: Colors.blue, width: 2.0),
                //           borderRadius: BorderRadius.circular(15.0),
                //         ),
                //       ),
                //       controller: cnic,
                //     )),
                SizedBox(height: size.height * 0.03),
                Container(
                    alignment: Alignment.center,
                    width: size.width * 0.70,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      //obscureText: true,
                      obscureText: _isObscure,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          color: Color(0xFFC2185B),
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        hintText: "Enter Password",
                        labelStyle: TextStyle(
                          color: Color(0xFFC2185B),
                        ),
                        icon: Icon(
                          Icons.password_rounded,
                          color: Color(0xFFC2185B),
                        ),
                        fillColor: Color(0xFFC2185B),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFC2185B), width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      controller: pass,
                    )),
                // SizedBox(height: size.height * 0.01),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 70),
                //   child: Container(
                //     child: DropdownButton(
                //       hint: Text("Select Service"),
                //       isExpanded: true,
                //       iconEnabledColor: Colors.blue.shade700,
                //       items: data.map((item) {
                //         return DropdownMenuItem(
                //           child: Row(
                //             children: [
                //               Icon(
                //                 Icons.settings,
                //                 color: Colors.blue.shade700,
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(left: 18.0),
                //                 child: Text(
                //                   item['name'],
                //                   style: TextStyle(color: Colors.blue),
                //                 ),
                //               ),
                //             ],
                //           ),
                //           value: item['Id'].toString(),
                //         );
                //       }).toList(),
                //       onChanged: (newVal) {
                //         setState(() {
                //           _mySelection = newVal;
                //           print(_mySelection);
                //         });
                //       },
                //       value: _mySelection,
                //     ),
                //   ),
                // ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: RaisedButton(
                            onPressed: () async {
                              _formKey.currentState.validate();
                              await auth.createUserWithEmailAndPassword(
                                  email: "${email.text}@gmail.com",
                                  password: pass.text);
                              register();
                              userStore();

                              setState(() {
                                // _determinePosition();
                              });
                              // insertData(
                              //     name.text, email.text, phone.text, pass.text);
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      reverseDuration: Duration(seconds: 1),
                                      duration: Duration(seconds: 1),
                                      child: MyOtp(value: phone.text)));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            textColor: Colors.white,
                            padding: const EdgeInsets.all(0),
                            child: Container(
                              alignment: Alignment.center,
                              height: size.height * 0.055,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xFFC2185B),
                              ),
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                "SIGNUP",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              reverseDuration: Duration(seconds: 1),
                              duration: Duration(seconds: 1),
                              child: LoginScreen()))
                    },
                    child: Text(
                      "Already Have Account ? Signin",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC2185B),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
