// import 'dart:convert';

// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;

// class IndexPage extends StatefulWidget {
//   @override
//   _IndexPageState createState() => _IndexPageState();
// }

// class _IndexPageState extends State<IndexPage> {
  


//   bool isLoading = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     this.fetchUser();
//   }
//   fetchUser() async {
   
  
   
//     var response = await http.get(Uri.http("https://bcsportal.com.pk", "uzair/api/users"));
//        var items = json.decode(response.body);
     
         
//   }

//   @override
//   Widget build(BuildContext context) {
   
//     throw UnimplementedError();
//   }

//     // print(response.body);
//     // if(response.statusCode==200)
//     // {
   
//     //   setState(() {
//     //     users = items;
//     //     isLoading = false;
//     //   });
//     // }else{
//     //   users = [];
//     //   isLoading = false;
//     // }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Listing Users"),
//       ),
//       body: getBody(),
//     );
//   }
//   Widget getBody(){
//     if(users.contains(null) || users.length < 0 || isLoading){
//       return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.black87),));
//     }
//     return ListView.builder(
//       itemCount: users.length,
//       itemBuilder: (context,index){
//       return getCard(users[index]);
//     });
//   }
//   Widget getCard(item){
//     var fullName = item['Name'];
//     var email = item['Email'];
//     // var profileUrl = item['picture']['large'];
//     return Card(
//       elevation: 1.5,
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: ListTile(
//           title: Row(
//             children: <Widget>[
//               Container(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   color: Colors.amberAccent,
//                   borderRadius: BorderRadius.circular(60/2),
                
//                 ),
//               ),
//               SizedBox(width: 20,),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width-140,
//                     child: Text(fullName,style: TextStyle(fontSize: 17),)),
//                   SizedBox(height: 10,),
//                   Text(email.toString(),style: TextStyle(color: Colors.grey),)
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }