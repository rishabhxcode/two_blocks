import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';
import 'package:two_blocks/widgets/choice_container.dart';

class EquationWidget extends StatelessWidget {
  final int var1;
  final int var2;
  final int result;
  final String operation;
  final int choiceSelected;
  final String choiceAnswer;

  const EquationWidget(
      {Key key,
      this.var1,
      this.var2,
      this.choiceSelected,
      this.operation,
      this.choiceAnswer,
      this.result})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
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
                    '$var1',
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
                : Text(var2 >= 0 ? '$var2' : '($var2)',
                    style: Constants.textStyle2),
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
