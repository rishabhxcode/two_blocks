import 'package:flutter/material.dart';

class NeuButton extends StatelessWidget {
  final Color fillColor;
  final double height;
  final double width;
  final Widget child;
  final Gradient gradient;
  final List<BoxShadow> shadows;
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
  final EdgeInsets padding;
  final EdgeInsets margin;
  const NeuButton({
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
    this.padding,
    this.margin,
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
          margin: margin,
          decoration: BoxDecoration(
            border: border,
            color: Colors.transparent,
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
            elevation: 0,
            borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(4)),
            child: InkWell(
                borderRadius:
                    borderRadius ?? BorderRadius.all(Radius.circular(4)),
                highlightColor: highLightColor ?? null,
                splashColor: splashColor ?? null,
                onTap: onTap ?? null,
                child: child),
          )),
    );
  }
}

class NeuButton2 extends StatelessWidget {
  final Color fillColor;
  final double height;
  final double width;
  final Widget child;
  final Gradient gradient;
  final List<BoxShadow> shadows;
  final BoxShape shape;
  final BorderRadius borderRadius;
  final Color splashColor;
  final Color highLightColor;
  final Function onTap;
  final BoxBorder border;
  final Duration duration;
  final Curve curve;
  final Function(TapDownDetails) onTapDown;
  final Function onTapCancel;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final DecorationImage image;

  const NeuButton2(
      {Key key,
      this.fillColor,
      this.height,
      this.width,
      this.gradient,
      this.shadows,
      this.shape,
      this.borderRadius,
      this.splashColor,
      this.highLightColor,
      this.onTap,
      this.border,
      this.duration,
      this.curve,
      this.onTapDown,
      this.onTapCancel,
      this.padding,
      this.margin,
      this.child,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        curve: curve ?? Curves.ease,
        height: height ?? 40,
        width: width ?? 100,
        padding: EdgeInsets.all(0),
        alignment: Alignment.center,
        duration: duration ?? Duration(milliseconds: 50),
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          color: Colors.transparent,
          image: image ?? null,
          gradient: gradient,
          border: border,
          borderRadius: borderRadius ?? BorderRadius.circular(6),
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
              child: SizedBox(
                height: height ?? 40,
                width: width ?? 100,
                child: child,
              )
              /// keep color of child transparent to show the Splash and HightLight Color ///
              ),
        ));
  }
}
