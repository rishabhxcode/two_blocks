
import 'package:flutter/material.dart';

class CustomButtonYellow extends StatelessWidget {
  final String text;
  final Function() onTap;


  static const Color white = Colors.white;
  static const Color yellow = Color(0xffffe5a3);
  static const Color yellowdark = Color(0xffd68400);
  CustomButtonYellow({
    this.text,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: yellow,
      child: Ink(
        decoration: BoxDecoration(
            gradient: RadialGradient(
                center: Alignment.center,
                radius: 1,
                focalRadius: 1,
                stops: [
                  0.0,1.0
                ],
                colors: [
                  yellowdark,
                  yellow
                  ])),
        child: FlatButton(
            onPressed: () {},
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(color: white, fontSize: 50),
              ),
            )),
      ),
    );
}
}
