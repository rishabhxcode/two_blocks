import 'package:flutter/material.dart';

class Constants {
  static const Color AccentColor = Color(0xffe1e8ea);
  static const Color BGColor = Color(0xffededed);
  static const Color DarkShadow = Color(0xffc9c9c9);
  static const String multiply = '\u00d7';
  static const String divide = '\u00f7';
  static const String add = '\u002B';
  static const String minus = '\u002D';
  static const String equals = '\u003D';

  //
  static const List<String> symbols = [add, minus, multiply, divide];
  //
  /*TextStyles*/
  static const TextStyle textStyle1 =
      TextStyle(fontSize: 14, color: Colors.black);

  static const TextStyle textStyle2 = TextStyle(fontSize: 50);
  /* shadows */
  static const List<BoxShadow> greenShadow = [
    BoxShadow(
      color: Colors.green,
    ),
    BoxShadow(
      color: BGColor,
      spreadRadius: -3.0,
      blurRadius: 1.0,
    ),
  ];

  static const List<BoxShadow> redShadow = [
    BoxShadow(
      color: Colors.red,
    ),
    BoxShadow(
      color: BGColor,
      spreadRadius: -3.0,
      blurRadius: 3.0,
    ),
  ];

  static const List<BoxShadow> nextButtonShadow = [
    BoxShadow(
        offset: Offset(2, 2),
        spreadRadius: 1,
        blurRadius: 3,
        color: Constants.DarkShadow),
    BoxShadow(
        offset: Offset(-1.5, -1.5),
        spreadRadius: 1,
        blurRadius: 3,
        color: Colors.white),
  ];
}
