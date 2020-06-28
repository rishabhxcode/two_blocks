import 'package:flutter/material.dart';

class ChoiceContainer extends StatelessWidget {
  final String choiceAnswer;

  const ChoiceContainer({Key key, this.choiceAnswer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: choiceAnswer.length < 3 ? 64 : 70 ?? 64,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            choiceAnswer ?? '',
            style: TextStyle(fontSize: 44, color: Colors.green[600]),
          )),
    );
  }
}
