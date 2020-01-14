import 'package:flutter/material.dart';

class CustomButtonPurple extends StatelessWidget {
  final String text;
  final Function() onTap;

  static const Color white = Colors.white;
  static const Color purple = Color(0xfff7bdff);
  static const Color purpledark = Color(0xffbe00e8);
  CustomButtonPurple({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: purple,
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
                  purpledark, 
                  purple
                  
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
