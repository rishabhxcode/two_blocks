import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';
import 'package:two_blocks/widgets/neu_button_widget.dart';

class NextButton extends StatelessWidget {
  final Function() onTap;

  const NextButton({Key? key, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NeuButtonWidget(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' Next',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w600),
            ),
            Icon(
              Icons.navigate_next,
              size: 30,
              color: Colors.deepPurple,
            ),
          ],
        ),
        fillColor: Constants.BGColor,
        shadows: Constants.nextButtonShadow,
        margin: EdgeInsets.only(right: 20),
        onTap: onTap);
  }
}
