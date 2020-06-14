import 'package:flutter/material.dart';

class AnimatedMessage extends StatelessWidget {
  final String message;
  final Color messageColor;
  final double messageSize;
  const AnimatedMessage(
      {Key key, this.message, this.messageColor, this.messageSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      alignment: Alignment.center,
      child: AnimatedDefaultTextStyle(
          child: Text(message),
          curve: Curves.easeOutBack,
          style: TextStyle(
              fontWeight: FontWeight.w300,
              color: messageColor,
              letterSpacing: 2,
              fontSize: messageSize),
          duration: const Duration(milliseconds: 300)),
    );
  }
}
