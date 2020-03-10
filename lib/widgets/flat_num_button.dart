

import 'package:flutter/material.dart';

class FlatNumButton extends StatelessWidget {
  final String number;
  final double topLeftBorder;
  final double bottomLeftBorder;
  final double topRightBorder;
  final double bottomRightBorder;
  const FlatNumButton(
      {Key key,
      this.number,
      this.topLeftBorder,
      this.bottomLeftBorder,
      this.topRightBorder,
      this.bottomRightBorder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeftBorder ?? 0),
                topRight: Radius.circular(topRightBorder ?? 0),
                bottomLeft: Radius.circular(bottomLeftBorder ?? 0),
                bottomRight: Radius.circular(bottomRightBorder ?? 0)),
            side: BorderSide(
                color: Colors.grey[300], style: BorderStyle.solid, width: 0.5)),
        child: Text(number ?? '?'),
        onPressed: () {},
      ),
    );
  }
}