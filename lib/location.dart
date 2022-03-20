// // import 'dart:convert';

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:fixhome2/login/component/background.dart';
// // import 'package:fixhome2/login/login.dart';
// // import 'package:fixhome2/login/otp.dart';
// // import 'package:geocoder/geocoder.dart';
// // import 'package:geocoder/model.dart';
// // import 'package:geolocator/geolocator.dart';
// // // import 'package:geolocator/geolocator.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:flutter/material.dart';

// // import 'package:fluttertoast/fluttertoast.dart';
// // import 'package:location/location.dart';
// // import 'package:page_transition/page_transition.dart';

// // class Register1Screen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       resizeToAvoidBottomInset: false,
// //       body: MyRegister(),
// //     );
// //   }
// // }

// // class MyRegister extends StatefulWidget {
// //   @override
// //   _MyRegisterState createState() => _MyRegisterState();
// // }

// // class _MyRegisterState extends State<MyRegister> {
// //   static Location location = new Location();
// //   static LocationData _locationData;
// //   static Address currenctAddress;
// //   String value = "";

// //   static get currenctAddressSubject => null;
// //   // void getcurrent() async {
// //   //   var position = await GeolocatorPlatform.instance. getCurrentPosition(locationSettings: );
// //   // }

// //   void getLocation() async {
// //     bool serviceEnabled;
// //     LocationPermission permission;

// //     serviceEnabled = await Geolocator.isLocationServiceEnabled();
// //     if (!serviceEnabled) {
// //       return Future.error('Location services are disabled.');
// //     }

// //     permission = await Geolocator.checkPermission();
// //     if (permission == LocationPermission.denied) {
// //       permission = await Geolocator.requestPermission();
// //       if (permission == LocationPermission.denied) {
// //         return Future.error('Location permissions are denied');
// //       }
// //     }

// //     if (permission == LocationPermission.deniedForever) {
// //       return Future.error(
// //           'Location permissions are permanently denied, we cannot request permissions.');
// //     }

// //     print(await Geolocator.getCurrentPosition());
// //     location = (await Geolocator.getCurrentPosition()) as Location;
// //   }

// //   static void _startLocationListner() async {
// //     //
// //     //update location every 100meters
// //     await location.changeSettings(distanceFilter: 10);

// //     //listen
// //     location.onLocationChanged.listen((LocationData currentLocation) {
// //       // Use current location
// //       _locationData = currentLocation;
// //       //
// //       geocodeCurrentLocation();
// //     });

// //     //get the current location on send to listeners
// //     _locationData = await location.getLocation();
// //     geocodeCurrentLocation();
// //   }

// //   //
// //   static geocodeCurrentLocation() async {
// //     if (_locationData != null) {
// //       final coordinates = new Coordinates(
// //         _locationData.latitude,
// //         _locationData.longitude,
// //       );

// //       try {
// //         //
// //         final addresses = await Geocoder.local.findAddressesFromCoordinates(
// //           coordinates,
// //         );
// //         //
// //         currenctAddress = addresses.first;
// //         print(currenctAddress);
// //         //
// //         currenctAddressSubject.add(currenctAddress);
// //       } catch (error) {
// //         print("Error get location ==> $error");
// //       }
// //     }
// //   }

// //   @override
// //   void initState() {
// //     getLocation();
// //     super.initState();
// //     geocodeCurrentLocation();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// //     Size size = MediaQuery.of(context).size;

// //     return Scaffold();
// //   }
// // }
// import 'dart:async';
// import 'dart:convert';
// // import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:fixhome2/login/component/background.dart';
// import 'package:fixhome2/login/login.dart';
// import 'package:fixhome2/login/otp.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:platform_maps_flutter/platform_maps_flutter.dart';

// class Register1Screen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: MyRegister(),
//     );
//   }
// }
// // 
// class MyRegister extends StatefulWidget {
//   @override
//   _MyRegisterState createState() => _MyRegisterState();
// }

// class _MyRegisterState extends State<MyRegister> {
//   var location;

//   void getLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
// Geolocator.
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

//   _getLocation() async {
//     Position position = await Geolocator.getCurrentPosition();
//     debugPrint('location: ${position}');
//     final coordinates = new Coordinates(position.latitude, position.longitude);
//     addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//     first = addresses.first;
//     first1 = await first.featureName;
//     first2 = await first.addressLine;
//     print("${first.featureName} : ${first.addressLine}");
//   }

//   var addresses;
//   var first;
//   var first1;
//   var first2;
//   @override
//   void initState() {
//     _getLocation();
//     getLocation();
//     super.initState();
//   }

//   String value = "";
//   // void getcurrent() async {
//   //   var position = await GeolocatorPlatform.instance. getCurrentPosition(locationSettings: );
//   // }
//   // Completer<GoogleMapController> _controller = Completer();

// //     Position position = await Geolocator.getCurrentPosition();
// //   static const LatLng _center = const LatLng(45.521563, -122.677433);
// // var long;
// // var lat;
//   @override
//   Widget build(BuildContext context) {
// //     final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// // var post = getLocation();
// // long =position.longitude;
// //     lat = position.longitude;
// //     Size size = MediaQuery.of(context).size;

//     return
//         // Scaffold(
//         //  body: GoogleMap(
//         //     onMapCreated: _onMapCreated,
//         //     initialCameraPosition: CameraPosition(
//         //       target: _center,
//         //       zoom: 11.0,
//         //     ),
//         //   ),
//         //       body: GoogleMap(
//         //         onMapCreated: _onMapCreated,
//         //         initialCameraPosition: CameraPosition(
//         //           target: _center,
//         //           zoom: 11.0,
//         //         ),
//         //       ),
//         //  );
//         // Scaffold(
//         //   body: PlatformMap(
//         //     initialCameraPosition: CameraPosition(
//         //       target: const LatLng(47.6, 8.8796),
//         //       zoom: 16.0,
//         //     ),
//         //     markers: Set<Marker>.of(
//         //       [
//         //         Marker(
//         //           markerId: MarkerId('marker_1'),
//         //           position: LatLng(47.6, 8.8796),
//         //           consumeTapEvents: true,
//         //           infoWindow: InfoWindow(
//         //             title: 'PlatformMarker',
//         //             snippet: "Hi I'm a Platform Marker",
//         //           ),
//         //           onTap: () {
//         //             print("Marker tapped");
//         //           },
//         //         ),
//         //       ],
//         //     ),
//         //     mapType: MapType.satellite,
//         //     onTap: (location) => print('onTap: $location'),
//         //     onCameraMove: (cameraUpdate) => print('onCameraMove: $cameraUpdate'),
//         //     compassEnabled: true,
//         //     onMapCreated: (controller) {
//         //       Future.delayed(Duration(seconds: 2)).then(
//         //         (_) {
//         //           controller.animateCamera(
//         //             CameraUpdate.newCameraPosition(
//         //               const CameraPosition(
//         //                 bearing: 270.0,
//         //                 target: LatLng(51.5160895, -0.1294527),
//         //                 tilt: 30.0,
//         //                 zoom: 18,
//         //               ),
//         //             ),
//         //           );
//         //           controller
//         //               .getVisibleRegion()
//         //               .then((bounds) => print("bounds: ${bounds.toString()}"));
//         //         },
//         //       );
//         //     },
//         //   ),
//         // );
//         Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(first1.toString()),
//             Text(first2.toString()),
//             Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//               child: RaisedButton(
//                 onPressed: () async {
//                   setState(() async {
//                     await _getLocation();
//                     first1;
//                     first2;
//                   });

//                   // insertData(
//                   //     name.text, email.text, phone.text, pass.text);
//                 },
//                 //     shape: RoundedRectangleBorder(
//                 //         borderRadius: BorderRadius.circular(80.0)),
//                 //     textColor: Colors.white,
//                 //     padding: const EdgeInsets.all(0),
//                 //     child: Container(
//                 //       alignment: Alignment.center,
//                 //       height: 40.0,
//                 //       width: size.width * 0.3,
//                 //       decoration: new BoxDecoration(
//                 //           borderRadius: BorderRadius.circular(10.0),
//                 //           gradient: new LinearGradient(
//                 //               colors: [Color(0xFFC2185B), Color(0xFFC2185B)])),
//                 //       padding: const EdgeInsets.all(0),
//                 //       child: Text(
//                 //         "SIGNUP",
//                 //         textAlign: TextAlign.center,
//                 //         style: TextStyle(fontWeight: FontWeight.bold),
//                 //       ),
//                 //     ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//  import 'package:flutter/material.dart';
//  import 'package:flutter/foundation.dart';
//  import 'package:google_maps/google_maps.dart';
 

//  class mappi extends StatefulWidget {
//    const mappi({ Key key }) : super(key: key);
 
//    @override
//    State<mappi> createState() => _mappiState();
//  }
 
//  class _mappiState extends State<mappi> {
//    @override
//    Widget build(BuildContext context) {
//      return Container(
       
//      );
//    }
//  }

