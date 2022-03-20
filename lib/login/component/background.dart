import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Image.asset(
              "assets/topi.png",
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          // Positioned(
          //   top: 0,
          //   right: 0,
          //   child: Image.asset("assets/tops.png", width: size.width),
          // ),
          // Positioned(
          //   top: 30,

          //   child:
          //       Image.asset("assets/logo.png", width: size.width * 0.25),

          // ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Image.asset("assets/B.png", width: size.width),
          // ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Image.asset("assets/bottoms.png", width: size.width),
          // ),
          child
        ],
      ),
    );
  }
}
