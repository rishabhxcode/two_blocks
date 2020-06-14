import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';
import 'package:two_blocks/widgets/choice_container.dart';

class EquationWidget extends StatelessWidget {
  final int opt1;
  final int opt2;
  final int result;
  final String operation;
  final int choiceSelected;
  final String choiceAnswer;

  const EquationWidget(
      {Key key,
      this.opt1,
      this.opt2,
      this.choiceSelected,
      this.operation,
      this.choiceAnswer,
      this.result})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            choiceSelected == 0
                ? ChoiceContainer(
                    choiceAnswer: choiceAnswer,
                  )
                : Text(
                    '$opt1',
                    style: Constants.textStyle2,
                  ),
            choiceSelected == 1
                ? ChoiceContainer(
                    choiceAnswer: choiceAnswer,
                  )
                : Text(operation, style: Constants.textStyle2),
            choiceSelected == 2
                ? ChoiceContainer(
                    choiceAnswer: choiceAnswer,
                  )
                : Text('$opt2', style: Constants.textStyle2),
            Text('=', style: Constants.textStyle2),
            choiceSelected == 3
                ? ChoiceContainer(
                    choiceAnswer: choiceAnswer,
                  )
                : Text('$result', style: Constants.textStyle2)
          ],
        ),
      ),
    );
  }
}
