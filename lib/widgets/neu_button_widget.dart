import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';

class NeuButtonWidget extends StatelessWidget {
  final Color? fillColor;
  final double height;
  final double width;
  final Widget? child;
  final Gradient? gradient;
  final List<BoxShadow>? shadows;
  final BoxShape shape;
  final BorderRadius? borderRadius;
  final Color? splashColor;
  final Color? highLightColor;
  final void Function()? onTap;
  final BoxBorder? border;
  final Duration? duration;
  final Curve curve;
  final Function(TapDownDetails)? onTapDown;
  final void Function()? onTapCancel;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final DecorationImage? image;
  final BorderRadius? boundaryRadius;

  const NeuButtonWidget({
    Key? key,
    this.fillColor,
    this.height = 40,
    this.width = 100,
    this.gradient,
    this.shadows,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.splashColor,
    this.highLightColor,
    this.onTap,
    this.border,
    this.duration,
    this.curve = Curves.ease,
    this.onTapDown,
    this.onTapCancel,
    this.padding,
    this.margin,
    this.child,
    this.image,
    this.boundaryRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: EdgeInsets.all(0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: shape,
        color: Colors.transparent,
        image: image,
        gradient: gradient,
        border: border,
        borderRadius: boundaryRadius ?? BorderRadius.circular(6),
        boxShadow: shadows ??
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
      ),
      child: Material(
        color: fillColor ?? Colors.grey[100],
        elevation: 0,
        borderRadius: borderRadius ?? BorderRadius.circular(4),
        borderOnForeground: true,
        child: InkWell(
            splashColor: splashColor ?? Colors.grey[400],
            highlightColor: highLightColor ?? Colors.grey[300],
            borderRadius: borderRadius ?? BorderRadius.circular(4),
            onTap: onTap ?? () {},
            onTapCancel: onTapCancel,
            onTapDown: onTapDown,
            child: Center(
              child: child,
            )

            /// keep color of child transparent to show the Splash and HightLight Color ///
            ),
      ),
    );
  }
}
