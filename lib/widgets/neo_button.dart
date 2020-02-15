import 'package:flutter/material.dart';

class NeoButton extends StatefulWidget {
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
  }) : super(key: key);
  @override
  _NeoButtonState createState() => _NeoButtonState();
}

class _NeoButtonState extends State<NeoButton> {
  @override
  Widget build(BuildContext context) {
    return Ink(
        height: widget.height ?? 40,
        width: widget.width ?? 100,
        decoration: BoxDecoration(
          border: widget.border,
          shape: widget.shape ?? BoxShape.rectangle,
          borderRadius:
              widget.borderRadius ?? BorderRadius.all(Radius.circular(4)),
          color: widget.fillColor ?? Theme.of(context).accentColor,
          gradient: widget.gradient,
          boxShadow: widget.shadows ??
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
        child: InkWell(
            borderRadius:
                widget.borderRadius ?? BorderRadius.all(Radius.circular(4)),
            highlightColor: widget.highLightColor ?? Colors.grey[300],
            splashColor: widget.splashColor ?? Colors.grey[400],
            onTap: widget.onTap,
            child: Center(child: widget.child)));
  }
}
