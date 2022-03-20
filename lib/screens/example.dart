// // ignore_for_file: file_names

// import 'dart:convert';
// import 'dart:math';

// import 'package:fixhome2/Models/models.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;


// class homepage extends StatefulWidget {
//   const homepage({Key key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<homepage> {
//   String url = "http://www.bcsportal.com.pk/test/service.php";

// getUser() async{
//   var response = await http.get(Uri.parse(url));
//   var resbody = json.decode(response.body);
//   List <userModel> userlist= [];
//   for(var i in resbody){
//     userModel users = userModel(Id: i["Id"], image:i ["image"], name: i["name"]);
//     userlist.add(users);
//   }
//   return userlist;
  
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//           future: getUser(),
//           builder: (context, AsyncSnapshot snapshot) {
//             if (snapshot.data == null) {
//               return Center(child: CircularProgressIndicator());
//             } else {
//               return ListView.builder(
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     userinfo(snapshot.data[index])));
//                       },
//                       child: Card(
//                         child: ListTile(
//                           leading: Text("${snapshot.data[index].Id}"),
//                           title: Text("${snapshot.data[index].name}"),
                          
//                         ),
//                       ),
//                     );
//                   });
//             }
//           }),
//     );
//   }
// }
// class userinfo extends StatelessWidget {
//   // String? name;
//    userModel data;
//   userinfo(this.data);

  

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(data.name,style: TextStyle(
//               fontSize: 50,
//               fontWeight: FontWeight.bold
//             ),),
//             Container(
//               height: 200,
//               child: Image.network(data.image)),
//           ],
//         ),
//       )
//     );
//   }
// }

