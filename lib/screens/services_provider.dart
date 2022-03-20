import 'dart:convert';

import 'package:fixhome2/screens/profile.dart';
import 'package:fixhome2/screens/singleperson.dart';
import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:fixhome2/sharedwidget/floatig%20.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class ServicesProvider extends StatefulWidget {
  var serviceName2;

  ServicesProvider({Key key, this.serviceName2}) : super(key: key);

  @override
  _ServicesProviderState createState() => _ServicesProviderState();
}

class _ServicesProviderState extends State<ServicesProvider> {
  var list = [];
  String link = "http://www.fixhome.pk/examples/";
  getList() async {
    final url = Uri.parse('http://www.fixhome.pk/examples/test/provider.php');
    http.Response response = await http.get(url);

    var obj = json.decode(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      for (int i = 0; i < obj.length; i++) {
        if (obj[i]['service_name'] == widget.serviceName2) {
          list.add({
            'image': obj[i]['profile'],
            'name': obj[i]['name'],
            'email': obj[i]['email'],
            'service_name': obj[i]['service_name'],
            'cnic': obj[i]['cnic'],
            'contact': obj[i]['contact'],
          });
        }

        print(obj[i]['service_name']);
      }
    }

    setState(() {});
  }

  @override
  void initState() {
    this.getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
       appBar:AppBar() ,
      drawer: MyDrawer(),
      floatingActionButton: Floart(),
      bottomNavigationBar: Mynav(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 4, right: 8, left: 8),
          child: SizedBox(
            height: heightScreen * 0.9,
            width: MediaQuery.of(context).size.width * 0.98,
            child: list.isNotEmpty
                ? ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: heightScreen * 0.14,
                        width: widthScreen,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Single(
                                          name: list[index]['name'],
                                          image: list[index]['image'],
                                          cnic: list[index]['cnic'],
                                          email: list[index]['email'],
                                          contact: list[index]['contact'],
                                          serviceName: list[index]
                                              ['service_name'],
                                        )));
                          },
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side:
                                  BorderSide(color: Colors.pink[700], width: 1),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.network(
                                    link + "${list[index]['image']}",
                                    width: widthScreen * 0.18,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 50, top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name: ' + list[index]['name'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Contact: ' + list[index]['contact'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Email: ' + list[index]['email'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                : Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
