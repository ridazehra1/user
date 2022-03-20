import 'dart:io';

import 'package:fixhome2/screens/HomePage.dart';
import 'package:fixhome2/screens/profile.dart';
import 'package:fixhome2/sharedwidget/bottomnav.dart';
import 'package:fixhome2/sharedwidget/drawer.dart';
import 'package:fixhome2/sharedwidget/floatig%20.dart';
import 'package:flutter/material.dart';



class Helpline extends StatelessWidget {
  const Helpline({Key key}) : super(key: key);

  get w800 => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:AppBar(
     
      
    ) ,
      drawer: MyDrawer(),
      body:Connectwith(),
     floatingActionButton:Floart(),
        bottomNavigationBar: Mynav(),
      );

  }
}
class Connectwith extends StatefulWidget {
  const Connectwith({ Key key }) : super(key: key);

  @override
  _ConnectwithState createState() => _ConnectwithState();
}

class _ConnectwithState extends State<Connectwith> {
  get globalswitchstatus => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.white,
                    Colors.white,
                    
                  ],
                ),),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,

              child: Container(
                child: Column(

                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.10,
                    ),
                    Text(
                      
                          "CONNECT WITH US",
                         
                      style: TextStyle(
                        fontFamily: globalswitchstatus == false ? "roboto" : "Mehr",
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                      ),
                    ),
                    

                    Container(
                      height: MediaQuery.of(context).size.height*0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            _launchURL("https://www.facebook.com/mmnewsvideos");
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            child: Image.asset("assets/facebook.png"),
                          ),

                        ),
                        GestureDetector(
                          onTap: (){
                            _launchURL("https://www.instagram.com/mmnewsdottv/");
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 45,
                            child: Image.asset("assets/insta.png"),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            _launchURL("https://twitter.com/mmnewsdottv/");
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 52,
                            child: Image.asset("assets/twitter.png"),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            _launchURL("https://www.youtube.com/c/MMNewsVideos");
                          },
                          child: CircleAvatar(
                           backgroundColor: Colors.white,
                            radius: 40,
                            child: Image.asset("assets/web.png"),
                            ),



                        ),


                      ],
                    ),


                    Container(
                      height: MediaQuery.of(context).size.height*0.08,
                    ),


                  ],
                ),
              ),
            ),
          )
    );
  }

}

void _launchURL(String s) {
}

