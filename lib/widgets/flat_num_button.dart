import 'package:flutter/material.dart';

class FlatNumButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final VoidCallback onTap;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadows;
  final Color? color;
  const FlatNumButton({
    Key? key,
    this.height = 100,
    this.width = 100,
    required this.text,
    required this.onTap,
    this.borderColor,
    this.borderRadius,
    this.boxShadows,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration:
          BoxDecoration(borderRadius: borderRadius, boxShadow: boxShadows),
      child: Material(
        color: color,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
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
