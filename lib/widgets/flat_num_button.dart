import 'package:flutter/material.dart';

class FlatNumButton extends StatelessWidget {
  final String number;
  final double topLeftBorder;
  final double bottomLeftBorder;
  final double topRightBorder;
  final double bottomRightBorder;
  const FlatNumButton(
      {Key? key,
      this.number = '?',
      this.topLeftBorder = 0,
      this.bottomLeftBorder = 0,
      this.topRightBorder = 0,
      this.bottomRightBorder = 0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeftBorder),
                topRight: Radius.circular(topRightBorder),
                bottomLeft: Radius.circular(bottomLeftBorder),
                bottomRight: Radius.circular(bottomRightBorder),
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.white; // the color when button is pressed
            }
            return null; // transparent
          }),
        ),
        child: Text(
          number,
        ),
        onPressed: () {},
      ),
    );
  }
}
