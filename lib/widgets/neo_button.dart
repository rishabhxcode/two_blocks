import 'package:flutter/material.dart';

class NeoButton extends StatelessWidget {
  final Color fillColor;
  final double height;
  final double width;
  final Widget child;
  final Gradient gradient;
  final List<Shadow> shadows;
  final BoxShape shape;
  final BorderRadius borderRadius;
  final Color splashColor;
  final Color highLightColor;
  final Function onTap;
  final BoxBorder border;
  final Duration duration;
  final Curve curve;
  final Function(TapUpDetails) onTapUp;
  final Function(TapDownDetails) onTapDown;
  final Function onTapCancel;

  const NeoButton({
    Key key,
    this.fillColor,
    this.height,
    this.width,
    this.child,
    this.gradient,
    this.shadows,
    this.shape,
    this.borderRadius,
    this.splashColor,
    this.highLightColor,
    this.onTap,
    this.border,
    this.duration,
    this.onTapUp,
    this.onTapDown,
    this.onTapCancel,
    this.curve,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: onTapUp,
      onTapDown: onTapDown,
      onTapCancel: onTapCancel,
      child: AnimatedContainer(
          duration: duration ?? Duration(milliseconds: 100),
          curve: curve ?? Curves.ease,
          height: height ?? 40,
          width: width ?? 100,
          decoration: BoxDecoration(
            border: border,
            shape: shape ?? BoxShape.rectangle,
            borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(4)),
            gradient: gradient,
            boxShadow: shadows ??
                [
                  BoxShadow(
                      offset: Offset(4, 4),
                      spreadRadius: 3,
                      blurRadius: 6,
                      color: Colors.grey.shade400),
                  BoxShadow(
                      offset: Offset(-3, -3),
                      spreadRadius: 3,
                      blurRadius: 6,
                      color: Colors.white),
                ],
          ),
          child: Material(
            color: fillColor ?? Theme.of(context).accentColor,
            child: InkWell(
                borderRadius:
                    borderRadius ?? BorderRadius.all(Radius.circular(4)),
                highlightColor: highLightColor ?? null,
                splashColor: splashColor ?? null,
                onTap: onTap ?? null,
                child: Center(child: child)),
          )),
    );
  }
}
