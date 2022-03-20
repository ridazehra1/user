import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixhome2/login/login.dart';
import 'package:fixhome2/screens/HomePage.dart';
import 'package:fixhome2/screens/profile.dart';
import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:fixhome2/sharedwidget/floatig%20.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


 FirebaseAuth auth = FirebaseAuth.instance;
var kaddu = googlee == true ? "$name" : auth.currentUser.displayName;
class Complain extends StatefulWidget {
  const Complain({Key key}) : super(key: key);

  @override
  State<Complain> createState() => _ComplainState();
}

class _ComplainState extends State<Complain> {
  @override
  void dispose() {
    name?.dispose();
    email?.dispose();
    user?.dispose();
    msg?.dispose();

    super.dispose();
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController user = TextEditingController();
  TextEditingController msg = TextEditingController();
  Future complaint() async {
    String url = "http://www.fixhome.pk/examples/test/complaint.php";
    var response = await http.post(Uri.parse(url), body: {
      "name": name.text,
      "email": email.text,
      "user": user.text,
      "msg": msg.text,
    });
    name.clear();
    email.clear();
    user.clear();
    msg.clear();
    var data = json.decode(response.body);
    if (data != "Error") {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeft,
              reverseDuration: Duration(seconds: 1),
              duration: Duration(seconds: 1),
              child: MyHomePage()));
    } else {}
  }

  get w800 => null;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                googlee == true ? "$namee1" : auth.currentUser.displayName,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.user,
                //Icon Size
                color: Colors.white, //Color Of Icon
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Profile();
                    },
                  ),
                );
              },
            ),
          ],
          backgroundColor: Color(0xFFC2185B),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),

      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Color(0xFFC2185B)),
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFC2185B), width: 2.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // errorBorder:
                          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                          // focusedErrorBorder:
                          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                          // errorStyle: TextStyle(color: Colors.purple),
                        ),
                        controller: name,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     labelStyle: TextStyle(color: Color(0xFFC2185B)),
                      //     labelText: 'Email',
                      //     border: OutlineInputBorder(),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderSide: const BorderSide(
                      //           color: Color(0xFFC2185B), width: 2.0),
                      //       borderRadius: BorderRadius.circular(15.0),
                      //     ),
                      //     // errorBorder:
                      //     //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                      //     // focusedErrorBorder:
                      //     //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                      //     // errorStyle: TextStyle(color: Colors.purple),
                      //   ),
                      //   controller: email,
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Color(0xFFC2185B)),
                          labelText: 'Username for complain',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFC2185B), width: 2.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // errorBorder:
                          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                          // focusedErrorBorder:
                          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                          // errorStyle: TextStyle(color: Colors.purple),
                        ),
                        controller: user,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(maxLines: 3,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Color(0xFFC2185B)),
                          labelText: 'Complain',
                          border: OutlineInputBorder(gapPadding: 20.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFFC2185B), width: 2.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          // errorBorder:
                          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                          // focusedErrorBorder:
                          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
                          // errorStyle: TextStyle(color: Colors.purple),
                        ),
                        controller: msg,
                      ),
                    ],
                  ),
                )),
            ButtonWidget(
                text: "Submit",
                onClicked: () {
                  complaint();
                  // setState(() {
                  //   name?.dispose();
                  //   email?.dispose();
                  //   user?.dispose();
                  //   msg?.dispose();

                  //   super.dispose();
                  // });
                })
          ],
        ),
      ),
      floatingActionButton: Floart(),
      bottomNavigationBar: Mynav(),
    );
  }
}
// class MyCustomForm2 extends StatefulWidget {
//   const MyCustomForm2({Key? key}) : super(key: key);

//   @override
//   MyCustomForm2State createState() {
//     return MyCustomForm2State();
//   }
// }

// // Create a corresponding State class.
// // This class holds data related to the form.
// class MyCustomForm2State extends State<MyCustomForm2> {
//   // Create a global key that uniquely identifies the Form widget
//   // and allows validation of the form.
//   //
//   // Note: This is a GlobalKey<FormState>,
//   // not a GlobalKey<MyCustomFormState>.
//   final _formKey = GlobalKey<FormState>();

//   get pass => null;

//   @override
//   Widget build(BuildContext context) {
//     // Build a Form widget using the _formKey created above.
// //     return Form(
// //       key: _formKey,
// //       child: Padding(
// //         padding: const EdgeInsets.all(15.0),
// //         child: SingleChildScrollView(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [

// //               Center(
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Container(
// //                         width: 300,
// //                         alignment: Alignment.center,
// //                         margin: EdgeInsets.symmetric(horizontal: 40),
// //                         child: TextFormField(
// //                           validator: (value) {
// //                       if (value == null || value.isEmpty) {
// //                         return 'Please enter some text';
// //                       }
// //                       return null;
// //                     },
// //                           decoration: InputDecoration(
// //                             labelText: "Enter Name",
// //                             labelStyle: TextStyle(color: Color(0xFFC2185B)),
// //                             hintText: "Rida Zehra",

// //                             fillColor: Color(0xFFC2185B),
// //                             focusedBorder: OutlineInputBorder(
// //                               borderSide: const BorderSide(
// //                                   color: Color(0xFFC2185B), width: 2.0),
// //                               borderRadius: BorderRadius.circular(15.0),
// //                             ),
// //                           ),
// //                             controller: pass,
// //                         )),
// //                 ),
// //               ),

// //                     Center(
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(8.0),
// //                         child: Container(
// //                         width: 300,
// //                         alignment: Alignment.center,
// //                         margin: EdgeInsets.symmetric(horizontal: 40),
// //                         child: TextFormField(
// //                           validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                         return 'Please enter your valid name';
// //                   }
// //                   return null;
// //                 },
// //                           decoration: InputDecoration(

// //                             labelText: "Provider Number",
// //                             labelStyle: TextStyle(color: Color(0xFFC2185B)),
// //                             hintText: "+923340210117",

// //                             fillColor: Color(0xFFC2185B),
// //                             focusedBorder: OutlineInputBorder(
// //                               borderSide: const BorderSide(
// //                                   color: Color(0xFFC2185B), width: 2.0),
// //                               borderRadius: BorderRadius.circular(15.0),
// //                             ),
// //                           ),
// //                             controller: pass,
// //                         )),
// //                       ),
// //                     ),

// //               Padding(
// //                 padding: const EdgeInsets.symmetric(vertical: 16.0),

// //                 child: Center(
// //                   child: ElevatedButton(
// //                     style: ElevatedButton.styleFrom(shadowColor:Color(0xFFC2185B),primary: Color(0xFFC2185B), ),
// //                     onPressed: () {
// //                       // Validate returns true if the form is valid, or false otherwise.
// //                       if (_formKey.currentState!.validate()) {
// //                         // If the form is valid, display a snackbar. In the real world,
// //                         // you'd often call a server or save the information in a database.
// //                         ScaffoldMessenger.of(context).showSnackBar(
// //                           const SnackBar(content: Text('Processing Data')),
// //                         );
// //                       }
// //                     },
// //                     child: const Text('Submit',),

// //                   ),

// //                 ),
// //               ),
// //             ],

// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    @required this.text,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RaisedButton(
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: 150,
          decoration: new BoxDecoration(
            color: Color(0xFFC2185B),
            borderRadius: BorderRadius.circular(10.0),
            // gradient: new LinearGradient(
            // colors: [Color(0xFFC2185B), Color(0xFFC2185B)]
          ),
          padding: const EdgeInsets.all(0),
          child: Text(
            "Submit",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // color: Theme.of(context).primaryColor,

        textColor: Colors.white,
        onPressed: onClicked,
      );
}





class MyApp110 extends StatelessWidget {
  const MyApp110({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
       
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}