import 'package:flutter/material.dart';

class FlatNumButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Function onTap;
  final Color borderColor;
  const FlatNumButton(
      {Key key,
      this.height,
      this.width,
      this.text,
      this.onTap,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 100,
    width: 100,
      padding: EdgeInsets.all(2),
      child: OutlineButton(
        borderSide: BorderSide(width: 3, color: borderColor),
        child: Text(
          text ?? '?',
          style: TextStyle(fontSize: 30),
        ),
        onPressed: onTap,
      ),
    );
  }
}
