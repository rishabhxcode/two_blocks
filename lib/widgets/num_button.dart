import 'package:flutter/material.dart';
import 'package:two_blocks/widgets/neu_button_widget.dart';

class NumButton extends StatelessWidget {
  final String numeral;

  const NumButton({Key key, this.numeral}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return NeuButtonWidget(
      child: Text(numeral),
    );
  }
}