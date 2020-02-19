import 'package:flutter/material.dart';

class NeuContainer extends StatelessWidget {
  final Color fillColor;
  final BorderRadius borderRadius;
  final double height;
  final double width;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Alignment alignment;
  final Widget child;
  final Gradient gradient;
  final List<BoxShadow> boxShadow;
  const NeuContainer(
      {Key key,
      this.fillColor,
      this.borderRadius,
      this.height,
      this.width,
      this.padding,
      this.alignment,
      this.child,
      this.margin,
      this.gradient,
      this.boxShadow,
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 60,
      width: width ?? 60,
      padding: padding,
      child: child,
      margin: margin,
      alignment: alignment ?? Alignment.center,
      decoration: BoxDecoration(
          boxShadow: boxShadow ??
              [
                BoxShadow(
                    offset: Offset(2, 2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    color: Colors.grey[400]),
                BoxShadow(
                    offset: Offset(-2, -2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    color: Colors.white),
              ],
          color: fillColor ?? Theme.of(context).accentColor,
          borderRadius: borderRadius ?? BorderRadius.circular(4),
          gradient: gradient),
    );
  }
}
