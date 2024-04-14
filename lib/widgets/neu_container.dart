import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';

class NeuContainer extends StatelessWidget {
  final Color? fillColor;
  final BorderRadius? borderRadius;
  final double height;
  final double width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Alignment alignment;
  final Widget? child;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadow;

  const NeuContainer({
    Key? key,
    this.fillColor,
    this.borderRadius,
    this.height = 60,
    this.width = 60,
    this.padding,
    this.alignment = Alignment.center,
    this.child,
    this.margin,
    this.gradient,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      child: child,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        boxShadow: boxShadow ??
            [
              BoxShadow(
                  offset: Offset(2, 2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  color: Constants.DarkShadow),
              BoxShadow(
                  offset: Offset(-2, -2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  color: Colors.white),
            ],
        color: fillColor ?? Theme.of(context).secondaryHeaderColor,
        borderRadius: borderRadius ?? BorderRadius.circular(4),
        gradient: gradient,
      ),
    );
  }
}
