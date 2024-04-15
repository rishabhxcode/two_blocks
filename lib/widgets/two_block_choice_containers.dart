import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';

class Choice1Container extends StatelessWidget {
  final String text;

  const Choice1Container({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      margin: EdgeInsets.symmetric(horizontal: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.shade200,
            ),
            BoxShadow(
              color: Constants.BGColor,
              spreadRadius: -1.0,
              blurRadius: 3.0,
            ),
          ]),
      child: Text(text, style: Constants.textStyle3),
    );
  }
}

class Choice2Container extends StatelessWidget {
  final String text;
  const Choice2Container({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      margin: EdgeInsets.symmetric(horizontal: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade200,
            ),
            BoxShadow(
              color: Constants.BGColor,
              spreadRadius: -1.0,
              blurRadius: 3.0,
            ),
          ]),
      child: Text(text, style: Constants.textStyle3),
    );
  }
}
