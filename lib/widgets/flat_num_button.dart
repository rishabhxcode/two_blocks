import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';
import 'package:two_blocks/widgets/concave_decoration.dart';

class FlatNumButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Function onTap;
  final Color borderColor;
  final BorderRadius borderRadius;
  final List<BoxShadow> boxShadows;
  const FlatNumButton(
      {Key key,
      this.height,
      this.width,
      this.text,
      this.onTap,
      this.borderColor,
      this.borderRadius,
      this.boxShadows})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(4),
          boxShadow: boxShadows),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius ?? BorderRadius.circular(4),
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
