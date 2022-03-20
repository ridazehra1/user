import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixhome2/register/register.dart';
import 'package:fixhome2/screens/HomePage.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';

import 'package:flutter/material.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:page_transition/page_transition.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'authentication.dart';
import 'component/background.dart';
import 'package:google_sign_in/google_sign_in.dart';

var googlee;
var namee1;

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ',
      home: MyLoginPage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFC2185B),
          iconTheme: IconThemeData(
            color: Colors.white,
          ), // set backbutton color here which will reflect in all screens.
        ),
      ),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  curretndata() async {
    final userCredentials = await FirebaseFirestore.instance
        .collection("Users")
        .doc(auth.currentUser?.uid)
        .get();
    namee1 = userCredentials.data()["name"];
    print("object $namee1");
  }
  // sign() {
  //   try {
  //     FirebaseAuth auth = FirebaseAuth.instance;
  //     final user = auth.signInWithEmailAndPassword(
  //         email: email.text, password: pass.text);
  //     Navigator.push(
  //         context,
  //         PageTransition(
  //             type: PageTransitionType.rightToLeft,
  //             reverseDuration: Duration(seconds: 1),
  //             duration: Duration(seconds: 1),
  //             child: MyHomePage()));
  //     print("User is log in");
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  signin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "${email.text}@gmail.com", password: pass.text);
      Fluttertoast.showToast(
          msg: "Login Successfull ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } catch (e) {
      print("ERROR $e");
      Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential

      print(' signInWithGoogle completed');
      poka2 = true;
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }
  }

  bool poka2 = false;

  userStore() async {
    final auth = FirebaseAuth.instance;

    FirebaseFirestore db = FirebaseFirestore.instance;
    String uid = await auth.currentUser.uid;

    try {
      final DocumentSnapshot snapshot =
          await db.collection("Users").doc(uid).get();
      final data = snapshot.data();
      print("${data.runtimeType}");
      // print("User is register ${data}");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken.token);

      // Once signed in, return the UserCredential

      return FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential)
          .then((value) => Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage())));
    } catch (e) {
      print("Facebook Error$e");
      Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Container(
                    alignment: Alignment.center,

                    // child: Image.asset("assets/logo.png", width: size.width * 0.45),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text("LOGIN",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                    alignment: Alignment.center,
                    width: size.width * 0.70,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      validator: (input) =>
                          input.isNotEmpty ? null : "Check your email",
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelStyle: TextStyle(
                          color: Color(0xFFC2185B),
                        ),
                        icon: Icon(
                          Icons.person_outline,
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
                  width: size.width * 0.70,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    obscureText: _isObscure,
                    validator: (input) =>
                        input.isNotEmpty ? null : "Check your Password",
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelStyle: TextStyle(
                        color: Color(0xFFC2185B),
                      ),
                      icon: Icon(
                        Icons.lock_open,
                        color: Color(0xFFC2185B),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Color(0xFFC2185B),
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                      fillColor: Color(0xFFC2185B),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFC2185B), width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    controller: pass,
                  ),
                  //                child: TextField(
                ),
                SizedBox(height: size.height * 0.03),
                // Container(
                //   alignment: Alignment.center,
                //   margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                //   child: Text(
                //     "Forgot your password?",
                //     style: TextStyle(
                //       fontSize: 12,
                //       color: Color(0xFFC2185B),
                //     ),
                //   ),
                // ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: RaisedButton(
                    onPressed: () {
                      _formKey.currentState.validate();

                      // print("Error");
                      curretndata();
                      // userStore();
                      googlee = true;
                      signin();
                      //  print("Error");
                      // login();
                      // login();
                      // AuthenticationHelper()
                      //     .signIn(
                      //         email: email.toString(), password: pass.toString())
                      //     .then((result) {
                      //   if (result != null) {
                      //     Navigator.push(
                      //         context,
                      //         PageTransition(
                      //             type: PageTransitionType.rightToLeft,
                      //             reverseDuration: Duration(seconds: 1),
                      //             duration: Duration(seconds: 1),
                      //             child: MyHomePage()));
                      //   } else {
                      //     Scaffold.of(context).showSnackBar(SnackBar(
                      //       content: Text(
                      //         result,
                      //         style: TextStyle(fontSize: 16),
                      //       ),
                      //     ));
                      //   }
                      // });
                      // login();
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
                        color: Color(0xFFC2185B),
                      ),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "LOGIN",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.058,
                  width: MediaQuery.of(context).size.width * 0.95,
                  // color: Colors.pink,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.08,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey[350].withOpacity(0.5),
                        ),
                        child: InkWell(
                          onTap: () {
                            signInWithFacebook();
                            print('Hello');
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 4, bottom: 4),
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.050,
                                  width:
                                      MediaQuery.of(context).size.width * 0.09,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(150),
                                    child: Image.asset(
                                      "assets/facebook.png",
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.80,
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Facebook",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.11,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey[350].withOpacity(0.5),
                        ),
                        child: InkWell(
                          onTap: () {
                            try {
                              googlee = false;
                              signInWithGoogle();
                              poka2
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()))
                                  : "error";
                            } catch (e) {
                              print(e.toString());
                            }
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 4, bottom: 4),
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.050,
                                  width:
                                      MediaQuery.of(context).size.width * 0.09,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(
                                      "assets/glogo.PNG",
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.80,
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Google",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
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

                /////////////////////////////fb
                ///
                // Padding(
                //   padding: const EdgeInsets.only(left: 25, right: 8),

                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(150),
                //     child: Image.asset(
                //       "assets/ggoogle.jpg",
                //       height: 100,
                //       width: 50,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
////////////uper wala code

                // child: Container(
                //   height: 50,
                //   width: 53,
                //   decoration: BoxDecoration(
                //     // color: Colors.blue,
                //     borderRadius: BorderRadius.circular(25),
                //     border:
                //         Border.all(color: Color(0xFFC2185B), width: 2),
                //   ),
                //   child: TextButton(
                //     style: ButtonStyle(
                //       // backgroundColor:
                //       //     MaterialStateProperty.all<Color>(Colors.green),
                //       shape: MaterialStateProperty.all<
                //           RoundedRectangleBorder>(
                //         RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(25)),
                //       ),
                //     ),
                //     onPressed: () {},
                //     child: Image.asset(
                //       "assets/twoo.PNG",
                //       fit: BoxFit.contain,
                //     ),
                //   ),
                // ),
                // ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: size.height * 0.03,
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
                              child: RegisterScreen())),
                    },
                    child: Text(
                      "Create Your Account ?Signup",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC2185B),
                      ),
                    ),
                  ),
                ),
                // ElevatedButton(
                //     onPressed: signInWithFacebook, child: Text("data")),
              ],
            ),
          ),
        ),
      ),
      // resizeToAvoidBottomInset: false,
      // appBar: new AppBar(
      //   backgroundColor: Colors.white,
      //   leading: new IconButton(
      //     icon: new Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //     ),
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => LoginScreen()),
      //       );
      //     },
      //   ),
      // ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Padding(
      //         padding: const EdgeInsets.only(top: 25),
      //         child: Container(
      //           alignment: Alignment.center,

      //           // child: Image.asset("assets/logo.png", width: size.width * 0.45),
      //           child: Padding(
      //             padding: const EdgeInsets.only(top: 8.0),
      //             child: Text("LOGIN",
      //                 style: TextStyle(
      //                     fontSize: 40,
      //                     fontWeight: FontWeight.bold,
      //                     color: Colors.black)),
      //           ),
      //         ),
      //       ),
      //       SizedBox(height: size.height * 0.03),
      //       Container(
      //           alignment: Alignment.center,
      //           width: 300,
      //           margin: EdgeInsets.symmetric(horizontal: 40),
      //           child: TextFormField(
      //             decoration: InputDecoration(
      //               labelText: "Email Address",
      //               labelStyle: TextStyle(color: Colors.blue.shade700),
      //               icon: Icon(
      //                 Icons.person_outline,
      //                 color: Colors.blue.shade700,
      //               ),
      //               fillColor: Colors.blue.shade700,
      //               focusedBorder: OutlineInputBorder(
      //                 borderSide: const BorderSide(
      //                     color: Colors.blueAccent, width: 2.0),
      //                 borderRadius: BorderRadius.circular(15.0),
      //               ),
      //             ),
      //             controller: email,
      //           )),
      //       SizedBox(height: size.height * 0.03),
      //       Container(
      //           width: 300,
      //           alignment: Alignment.center,
      //           margin: EdgeInsets.symmetric(horizontal: 40),
      //           child: TextFormField(
      //             decoration: InputDecoration(
      //               labelText: "Enter Password",
      //               labelStyle: TextStyle(color: Colors.blue.shade700),
      //               icon: Icon(
      //                 Icons.lock_open,
      //                 color: Colors.blue.shade700,
      //               ),
      //               fillColor: Colors.blue.shade700,
      //               focusedBorder: OutlineInputBorder(
      //                 borderSide:
      //                     const BorderSide(color: Colors.blue, width: 2.0),
      //                 borderRadius: BorderRadius.circular(15.0),
      //               ),
      //             ),
      //             controller: pass,
      //           )),
      //       SizedBox(height: size.height * 0.03),
      //       Container(
      //         alignment: Alignment.center,
      //         margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      //         child: Text(
      //           "Forgot your password?",
      //           style: TextStyle(
      //               letterSpacing: 1,
      //               fontWeight: FontWeight.bold,
      //               fontSize: 16,
      //               color: Colors.black),
      //         ),
      //       ),
      //       SizedBox(height: size.height * 0.05),
      //       Container(
      //         alignment: Alignment.center,
      //         margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      //         child: RaisedButton(
      //           onPressed: () {
      //             // login();
      //             // AuthenticationHelper()
      //             //     .signIn(email: email.toString(), password: pass.toString())
      //             //     .then((result) {
      //             //   if (result == null) {

      //             //   } else {
      //             //     Scaffold.of(context).showSnackBar(SnackBar(
      //             //       content: Text(
      //             //         result,
      //             //         style: TextStyle(fontSize: 16),
      //             //       ),
      //             //     ));
      //             //   }
      //             // });
      //             // login();
      //             Navigator.push(
      //                 context,
      //                 PageTransition(
      //                     type: PageTransitionType.rightToLeft,
      //                     reverseDuration: Duration(seconds: 1),
      //                     duration: Duration(seconds: 1),
      //                     child: MyHomePage()));
      //           },
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(80.0)),
      //           textColor: Colors.white,
      //           padding: const EdgeInsets.all(0),
      //           child: Container(
      //             alignment: Alignment.center,
      //             height: 40.0,
      //             width: size.width * 0.3,
      //             decoration: new BoxDecoration(
      //                 borderRadius: BorderRadius.circular(10.0),
      //                 gradient: new LinearGradient(colors: [
      //                   Colors.blue.shade700,
      //                   Colors.blue.shade700
      //                 ])),
      //             padding: const EdgeInsets.all(0),
      //             child: Text(
      //               "LOGIN",
      //               textAlign: TextAlign.center,
      //               style: TextStyle(fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //         ),
      //       ),
      //       Container(
      //         alignment: Alignment.center,
      //         margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      //         child: GestureDetector(
      //           onTap: () => {
      //             Navigator.push(
      //                 context,
      //                 PageTransition(
      //                     type: PageTransitionType.rightToLeft,
      //                     reverseDuration: Duration(seconds: 1),
      //                     duration: Duration(seconds: 1),
      //                     child: RegisterScreen())),
      //           },
      //           child: Text(
      //             "Create Your Account ?Signup",
      //             style: TextStyle(
      //                 letterSpacing: 1,
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 15,
      //                 color: Colors.black),
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
