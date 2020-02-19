import 'package:flutter/material.dart';
import 'package:two_blocks/widgets/neu_button.dart';

class NumButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final double textSize;
  final Color textColor;
  final FontWeight fontWeight;

  const NumButton(
      {Key key,
      this.height,
      this.width,
      this.text,
      this.textSize,
      this.textColor,
      this.fontWeight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NeuButton(
      height: height,
      width: width,
      child: Text(
        text ?? '?',
        style: TextStyle(
          fontSize: textSize ?? null,
          color: textColor,
        ),
      ),
    );
  }
}
