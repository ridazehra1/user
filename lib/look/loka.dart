import 'dart:convert';

import 'package:fixhome2/Models/models.dart';
import 'package:fixhome2/screens/body1.dart';
import 'package:fixhome2/screens/profile.dart';
import 'package:fixhome2/screens/services_provider.dart';
import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

// class lok1 extends StatelessWidget {
//   const lok1({Key key}) : super(key: key);
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _marker.addAll(_list);
//     getList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => lokko()));
//             },
//             child: Text("map")),
//       ),
//     );
//   }
// }

class lokko extends StatefulWidget {
  String serviceName;
  lokko({this.serviceName});
  // static LatLng _initialPosition;
  // final Set<Marker> _markers = {};
  // static LatLng _lastMapPosition = _initialPosition;
  @override
  State<lokko> createState() => _lokkoState();
}

class _lokkoState extends State<lokko> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProvider();
  }

  var list1 = [];
  List<Marker> _marker = [];
  // getList() async {
  //   final url = Uri.parse('http://www.fixhome.pk/examples/test/provider.php');
  //   http.Response response = await http.get(url);

  //   var obj = json.decode(response.body);

  // if (response.statusCode == 200 || response.statusCode == 400) {
  //   for (int i = 0; i < obj.length; i++) {
  //     if (obj[i]['service_name'] == widget.serviceName) {
  //       list1.add({
  //         'lat': obj[i]['lat'],
  //         'long': obj[i]['long'],
  //         'location': obj[i]['location'],
  //       });
  //     }
  //     List list12 = [
  //       Marker(
  //         markerId: MarkerId(i.toString()),
  //         position: LatLng(list1.),
  //       ),
  //     ];
  //     print(list12);
  //     print("${obj[i]['location']} $i");
  //   }
  // }

  //   // setState(() {});
  //   // print("$list12");
  // }
  List<Marker> _list1 = [];
  getProvider() async {
    final url = Uri.parse('http://www.fixhome.pk/examples/test/provider.php');
    http.Response response = await http.get(url);

    var resbody = json.decode(response.body);
    print('get provider enter');
    print(resbody.length);
    var spid = resbody[0]['location'];

    for (int i = 0; i < resbody.length; i++) {
      var loc = resbody[i]['location'].split(',');

      _list1.add(
        Marker(
          markerId: MarkerId(i.toString()),
          position: LatLng(double.parse(loc[0]), double.parse(loc[1])),
        ),
      );

      // providerModel _list = providerModel(

      //     location: resbody[i]["location"],
      //   );        prolist.add(_list);
      // print(_list.location);
    }
    print('list by iteration');
    for (int i = 0; i < _list1.length; i++) {
      print(_list1[i]);
    }

    _marker.addAll(_list1);
    setState(() {});
    print('list here');
    print(_list1);
  }

  // String serviceName2;
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;

  GoogleMapController _googleMapController;
  // List<Marker> _marker = [];
  // List<Marker> _list = [
  //   Marker(
  //     markerId: MarkerId("1"),
  //     position: LatLng(24.887913, 67.0583857),
  //   ),
  //   Marker(
  //     markerId: MarkerId("2"),
  //     position: LatLng(24.887913, 67.0632956),
  //   ),
  //   Marker(
  //     markerId: MarkerId("4"),
  //     position: LatLng(24.8600955, 67.1632959),
  //   ),
  // ];
  Marker _destination;

  @override
  void dispose() {
    _googleMapController.dispose();
    // _getUserLocation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
              enableFeedback: false,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              // icon: Icon(
              //   Icons.home_outlined,
              //   color: Colors.white,
              //   size: 35,
              // ),
              icon: Icon(
                FontAwesomeIcons.user,
                //Icon Size
                color: Colors.white, //Color Of Icon
              )),
        ],
        backgroundColor: Color(0xFFC2185B),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: GoogleMap(
              zoomGesturesEnabled: true,
              tiltGesturesEnabled: false,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(lat, long),
                zoom: 11.0,
              ),
              onMapCreated: (controller) => _googleMapController = controller,
              markers: Set<Marker>.of(_marker),
              // CameraPosition(
              //           target: _initialPosition,
              //           zoom: 14.4746,
              //         ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ServicesProvider(
                            serviceName2: widget.serviceName)));
              },
              child: Text("View List"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.pink.shade600),
              ),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     getProvider();
          //   },
          //   child: Text("View List"),
          //   style: ButtonStyle(
          //     backgroundColor:
          //         MaterialStateProperty.all<Color>(Colors.pink.shade600),
          //   ),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink.shade600,
          child: Icon(
            Icons.location_searching,
            size: 30,
          ),
          onPressed: () => _googleMapController.animateCamera(
              CameraUpdate.newCameraPosition(
                  CameraPosition(target: LatLng(lat, long))))),
      bottomNavigationBar: Mynav(),
    );
  }
}

// var long;
// var lat;

// class Map extends StatefulWidget {
//   @override
//   _MapState createState() => _MapState();
// }

// class _MapState extends State<Map> {
//   Completer<GoogleMapController> controller1;

//   //static LatLng _center = LatLng(-15.4630239974464, 28.363397732282127);
//   static LatLng _initialPosition;
//   final Set<Marker> _markers = {};
//   static LatLng _lastMapPosition = _initialPosition;

//   @override
//   void initState() {
//     super.initState();
//     _getUserLocation();
//   }

//   void _getUserLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     List<Placemark> placemark =
//         await placemarkFromCoordinates(position.latitude, position.longitude);
//     setState(() {
//       _initialPosition = LatLng(position.latitude, position.longitude);
//       print('${placemark[0].name}');
//     });
//     long = position.longitude;
//     lat = position.latitude;
//   }

//   _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       controller1.complete(controller);
//     });
//   }

//   MapType _currentMapType = MapType.normal;

//   void _onMapTypeButtonPressed() {
//     setState(() {
//       _currentMapType = _currentMapType == MapType.normal
//           ? MapType.satellite
//           : MapType.normal;
//     });
//   }

//   _onCameraMove(CameraPosition position) {
//     _lastMapPosition = position.target;
//   }

//   _onAddMarkerButtonPressed() {
//     setState(() {
//       _markers.add(Marker(
//           markerId: MarkerId(_lastMapPosition.toString()),
//           position: _lastMapPosition,
//           infoWindow: InfoWindow(
//               title: "Pizza Parlour",
//               snippet: "This is a snippet",
//               onTap: () {}),
//           onTap: () {},
//           icon: BitmapDescriptor.defaultMarker));
//     });
//   }

//   Widget mapButton(Function function, Icon icon, Color color) {
//     return RawMaterialButton(
//       onPressed: function,
//       child: icon,
//       shape: new CircleBorder(),
//       elevation: 2.0,
//       fillColor: color,
//       padding: const EdgeInsets.all(7.0),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _initialPosition == null
//           ? Container(
//               child: Center(
//                 child: Text(
//                   'loading map..',
//                   style: TextStyle(
//                       fontFamily: 'Avenir-Medium', color: Colors.grey[400]),
//                 ),
//               ),
//             )
//           : Container(
//               child: Stack(children: <Widget>[
//                 GoogleMap(
//                   markers: _markers,
//                   mapType: _currentMapType,
//                   initialCameraPosition: CameraPosition(
//                     target: _initialPosition,
//                     zoom: 14.4746,
//                   ),
//                   onMapCreated: _onMapCreated,
//                   zoomGesturesEnabled: true,
//                   onCameraMove: _onCameraMove,
//                   myLocationEnabled: true,
//                   compassEnabled: true,
//                   myLocationButtonEnabled: false,
//                 ),
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Container(
//                       margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
//                       child: Column(
//                         children: <Widget>[
//                           mapButton(_onAddMarkerButtonPressed,
//                               Icon(Icons.add_location), Colors.blue),
//                           mapButton(
//                               _onMapTypeButtonPressed,
//                               Icon(
//                                 IconData(0xf473,
//                                     fontFamily: CupertinoIcons.iconFont,
//                                     fontPackage:
//                                         CupertinoIcons.iconFontPackage),
//                               ),
//                               Colors.green),
//                         ],
//                       )),
//                 )
//               ]),
//             ),
//     );
//   }
// }
// Share
// Improve this answer
// Follow
// answered Oct 12, 2019 at 13:59

// K.chim