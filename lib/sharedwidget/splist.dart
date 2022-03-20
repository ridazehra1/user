// import 'package:fixhome2/compnent/services.dart';
// import 'package:fixhome2/screens/singleperson.dart';
// import 'package:fixhome2/screens/splistbody.dart';
// import 'package:flutter/material.dart';
// import 'package:page_transition/page_transition.dart';

// class SpList extends StatelessWidget {
//   // const SpList({Key? key}) : super(key: key);

//   get w800 => null;


//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
// //     return ListView(

//     return Scaffold(
//       body: FutureBuilder(
//           future: getProvider(),
//           builder: (context, AsyncSnapshot snapshot) {
//             if (snapshot.data == null) {
//               return Center(child: CircularProgressIndicator());
//             } else {
//               return Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 child: ListView.builder(
//                     itemCount: snapshot.data.length,
//                     itemBuilder: (context, index) {
                    
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       Single(snapshot.data[index])));
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                               height: 100,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(25.0),
//                                 border: Border.all(
//                                   color: Colors.grey,
//                                   width: 2,
//                                 ),
//                               ),
//                               child: ListTile(
//                                 title: Text(
//                                   "${snapshot.data[index].service}",
//                                   style: TextStyle(color: Color(0xFFC2185B)),
//                                 ),
//                                 subtitle: Text("${snapshot.data[index].name}",
//                                     style: TextStyle(color: Colors.black)),
//                                 leading: CircleAvatar(
//                                     child: Image.network(
//                                         "${snapshot.data[index].profile}")),
//                                 trailing: Icon(
//                                   Icons.add_moderator,
//                                   color: Colors.amber.shade800,
//                                 ),
//                               )),
//                         ),
//                       );
//                     }),
//               );
//             }
//           }),
//     );
//   }
// }
