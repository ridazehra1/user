import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixhome2/login/component/background.dart';
import 'package:fixhome2/login/login.dart';
import 'package:fixhome2/login/second.dart';
// import 'package:fixhome2/login/login.dart';
import 'package:fixhome2/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:page_transition/page_transition.dart';

class MyOtp extends StatefulWidget {
  String value;
  MyOtp({this.value});
  @override
  _MyOtp createState() => _MyOtp(value);
}

class _MyOtp extends State<MyOtp> {
  TextEditingController otpController = TextEditingController();
  String value = "";
  String otp = "";
  _MyOtp(this.value);
  FirebaseAuth auth = FirebaseAuth.instance;

  bool otpVisibility = false;

  String verificationID = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loginWithPhone();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // body: Background(
      //   child: SingleChildScrollView(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Container(
      //             alignment: Alignment.center,
      //             child: Text(
      //               value,
      //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      //             )),
      //         SizedBox(height: size.height * 0.03),
      //         Container(
      //           alignment: Alignment.center,
      //           width: 300,
      //           margin: EdgeInsets.symmetric(horizontal: 40),
      //           child: OTPTextField(
      //             length: 6,
      //             width: MediaQuery.of(context).size.width,
      //             textFieldAlignment: MainAxisAlignment.spaceAround,
      //             fieldWidth: 30,
      //             outlineBorderRadius: 15,
      //             style: TextStyle(fontSize: 17),
      //             onCompleted: (otp) {
      //               otp = otp;
      //             },
      //           ),

      //           // child: TextFormField(
      //           //   decoration: InputDecoration(
      //           //     labelText: "Email Address",
      //           //     labelStyle: TextStyle(color: Color(0xFFC2185B)),
      //           //     icon: Icon(
      //           //       Icons.person_outline,
      //           //       color: Color(0xFFC2185B),
      //           //     ),
      //           //     fillColor: Color(0xFFC2185B),
      //           //     focusedBorder: OutlineInputBorder(
      //           //       borderSide: const BorderSide(
      //           //           color: Color(0xFFC2185B), width: 2.0),
      //           //       borderRadius: BorderRadius.circular(15.0),
      //           //     ),
      //           //   ),

      //           // )
      //         ),
      //         SizedBox(height: size.height * 0.03),
      //         Container(
      //           width: 300,
      //           alignment: Alignment.center,
      //           margin: EdgeInsets.symmetric(horizontal: 40),
      //           // child: TextFormField(
      //           //   decoration: InputDecoration(
      //           //     labelText: "Enter Password",
      //           //     labelStyle: TextStyle(color: Color(0xFFC2185B)),
      //           //     icon: Icon(
      //           //       Icons.lock_open,
      //           //       color: Color(0xFFC2185B),
      //           //     ),
      //           //     fillColor: Color(0xFFC2185B),
      //           //     focusedBorder: OutlineInputBorder(
      //           //       borderSide: const BorderSide(
      //           //           color: Color(0xFFC2185B), width: 2.0),
      //           //       borderRadius: BorderRadius.circular(15.0),
      //           //     ),
      //           //   ),

      //           // )
      //         ),
      //         SizedBox(height: size.height * 0.05),
      //         Container(
      //           alignment: Alignment.center,
      //           margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      //           child: RaisedButton(
      //             onPressed: () {
      //               // login();
      //               Navigator.push(
      //                   context,
      //                   PageTransition(
      //                       type: PageTransitionType.rightToLeft,
      //                       reverseDuration: Duration(seconds: 1),
      //                       duration: Duration(seconds: 1),
      //                       child: MyHomePage1(
      //                         otp: otp,
      //                       )));
      //             },
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(80.0)),
      //             textColor: Colors.white,
      //             padding: const EdgeInsets.all(0),
      //             child: Container(
      //               alignment: Alignment.center,
      //               height: 30.0,
      //               width: size.width * 0.3,
      //               decoration: new BoxDecoration(
      //                   borderRadius: BorderRadius.circular(10.0),
      //                   gradient: new LinearGradient(
      //                       colors: [Color(0xFFC2185B), Color(0xFFC2185B)])),
      //               padding: const EdgeInsets.all(0),
      //               child: Text(
      //                 "VERIFY",
      //                 textAlign: TextAlign.center,
      //                 style: TextStyle(fontWeight: FontWeight.bold),
      //               ),
      //             ),
      //           ),
      //         ),
      //         SizedBox(height: size.height * 0.05),
      //         Container(
      //           alignment: Alignment.center,
      //           margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      //           child: GestureDetector(
      //             onTap: () => {
      //               Navigator.push(
      //                   context,
      //                   PageTransition(
      //                       type: PageTransitionType.rightToLeft,
      //                       reverseDuration: Duration(seconds: 1),
      //                       duration: Duration(seconds: 1),
      //                       child: MyOtp()))
      //             },
      //             child: Text(
      //               "Resend Code !",
      //               style: TextStyle(
      //                   fontSize: 12,
      //                   fontWeight: FontWeight.bold,
      //                   color: Color(0xFFC2185B)),
      //             ),
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Verification",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  )),
              SizedBox(height: size.height * 0.03),
              Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Your Registered Number " + value,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
              SizedBox(height: size.height * 0.03),
              Container(
                  width: 300,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: otpController,
                    decoration: InputDecoration(
                      labelText: "Enter OTP Code",
                      labelStyle: TextStyle(color: Color(0xFFC2185B)),
                      // icon: Icon(
                      //   Icons.lock_open,
                      //   color: Color(0xFFC2185B),
                      // ),
                      fillColor: Color(0xFFC2185B),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFC2185B), width: 2.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: () {
                    // login();
                    verifyOTP();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.0,
                    width: size.width * 0.3,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: new LinearGradient(
                            colors: [Color(0xFFC2185B), Color(0xFFC2185B)])),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "VERIFY",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    loginWithPhone();
                  },
                  child: Text(
                    "Resend Code!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 9,
                        color: Colors.pink),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  void loginWithPhone() async {
    try {
      auth.verifyPhoneNumber(
        phoneNumber: "+92" + value,
        timeout: Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            print("You are logged in successfully");
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int resendToken) {
          otpVisibility = true;
          verificationID = verificationId;

          setState(() {});
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print(e.toString());
    }
  }

  void verifyOTP() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: otpController.text);

      await auth.signInWithCredential(credential).then(
        (value) {
          print("You are logged in successfully");
          Fluttertoast.showToast(
            msg: "You are logged in successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.pink.shade400,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        },
      );
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeft,
              reverseDuration: Duration(seconds: 1),
              duration: Duration(seconds: 1),
              child: LoginScreen()));
    } catch (e) {
      print(e.toString());
    }
  }
}
