// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class gmail extends StatelessWidget {
//   const gmail({Key key}) : super(key: key);
//   Future<UserCredential> signInWithGoogle() async {
//     // Trigger the authentication flow
//     final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

//     // Obtain the auth details from the request
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser?.authentication;

//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );
// final user = FirebaseAuth.instance.currentUser;
//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child:
//               ElevatedButton(onPressed:

//               signInWithGoogle();

//               , child: Text("data"))),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/services.dart';
// hello

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:async/async.dart';

// import 'dart:io';
// import 'package:http/http.dart' as http;

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File _image;
  final picker = ImagePicker();

  TextEditingController nameContr = TextEditingController();

  Future choiceImage() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  String url = "http://www.fixhome.pk/examples/test/uplod.php";
  Future upload1(File imageFile) async {
    try {
      var stream =
          http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      var length = await imageFile.length();
      var uri = Uri.parse("http://www.fixhome.pk/examples/test/uplod.php");

      var request = http.MultipartRequest("POST", uri);
      request.fields['image'] = nameContr.text;

      // var pic = await http.MultipartFile.fromPath("image", imageFile.path);
      var pic = http.MultipartFile("image", stream, length,
          filename: basename(imageFile.path));

      request.files.add(pic);
      var response = await request.send();
      print(response.statusCode);
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });

      nameContr.text = "";
    } catch (e) {
      print(e.toString());
    }
  }

  Upload() async {
    try {
      var stream =
          new http.ByteStream(DelegatingStream.typed(image.openRead()));
      var length = await image.length();

      var uri = Uri.parse(url);

      var request = new http.MultipartRequest("POST", uri);
      var multipartFile = new http.MultipartFile('file', stream, length,
          filename: basename(image.path));
      //contentType: new MediaType('image', 'png'));

      request.files.add(multipartFile);
      var response = await request.send();
      print(response.statusCode);
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });
    } catch (e) {
      print("Failed to pick image: $e");
    }
  }

//////////////////////////camera
  ///
  File image;

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameContr,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            IconButton(
              icon: Icon(Icons.camera),
              onPressed: () {
                choiceImage();
              },
            ),
            Container(
              width: 300,
              height: 300,
              child: _image == null
                  ? Text('No image selected')
                  : Image.file(_image),
            ),
            Column(
              children: [
                RaisedButton(
                  child: Text('Upload Image'),
                  onPressed: () {
                    upload1(_image);
                  },
                ),
////////////////CAMERABTN
                RaisedButton(
                    child: Text('Click Image'),
                    onPressed: () {
                      pickImageC();
                    }),
                ElevatedButton(
                    onPressed: () {
                      Upload();
                    },
                    child: Text("data")),

                SizedBox(
                  height: 20,
                ),
                image != null ? Image.file(image) : Text("No image selected")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
