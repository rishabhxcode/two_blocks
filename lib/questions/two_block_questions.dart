import 'package:two_blocks/constants.dart';
import 'package:two_blocks/questions/one_block_questions.dart';
import 'dart:math';

class TwoBlockQuestions {
  OneBlockQuestions ob = OneBlockQuestions();
  Random random = Random();

  String _operation;
  int _var1;
  int _var2;
  int _result;

  int _choice1;
  int _choice2;
  dynamic _answerA;
  dynamic _answerB;
  int _buttonASelected;
  int _buttonBSelected;
  dynamic _optA1;
  dynamic _optA2;
  dynamic _optA3;
  dynamic _optA4;
  dynamic _optB1;
  dynamic _optB2;
  dynamic _optB3;
  dynamic _optB4;

  String get operation => _operation;
  int get var1 => _var1;
  int get var2 => _var2;
  int get result => _result;
  dynamic get answerA => _answerA;
  dynamic get answerB => _answerB;
  int get choice1 => _choice1;
  int get choice2 => _choice2;
  int get buttonASelcted => _buttonASelected;
  int get buttonBSelected => _buttonBSelected;
  dynamic get optA1 => _optA1;
  dynamic get optA2 => _optA2;
  dynamic get optA3 => _optA3;
  dynamic get optA4 => _optA4;
  dynamic get optB1 => _optB1;
  dynamic get optB2 => _optB2;
  dynamic get optB3 => _optB3;
  dynamic get optB4 => _optB4;

  String operationGenerator() {
    return ob.operationGenerator();
  }

  int var1Generator(operation) {
    return ob.var1Generator(operation);
  }

  int var2Generator(operation, var1) {
    return ob.var2Generator(operation, var1);
  }

  resultGenerator(operand, var1, var2) {
    return ob.resultGenerator(operand, var1, var2);
  }

  choice1Selection() {
    return random.nextInt(3);
  }

  choice2Selection(choice1) {
    return choice1 + 1 + random.nextInt(4 - choice1 - 1);
  }

  dynamic ansAGenerator(choice1, var1, operand, var2, result) {
    return ob.answerGenerator(choice1, var1, operand, var2, result);
  }

  dynamic ansBGenerator(choice2, var1, operand, var2, result) {
    return ob.answerGenerator(choice2, var1, operand, var2, result);
  }

  buttonAselected() {
    return ob.buttonSelected();
  }

  buttonBselected() {
    return ob.buttonSelected();
  }

//

  optA1Generator(buttonAselected, choice1, answerA) {
    return ob.opt1Generator(buttonAselected, choice1, answerA);
  }

  optA2Generator(buttonAselected, choice1, answerA, optA1) {
    return ob.opt2Generator(buttonAselected, choice1, answerA, optA1);
  }

  optA3Generator(buttonAselected, choice1, answerA, optA1, optA2) {
    return ob.opt3Generator(buttonAselected, choice1, answerA, optA1, optA2);
  }

  optA4Generator(buttonAselected, choice1, answerA, optA1, optA2, optA3) {
    return ob.opt4Generator(
        buttonAselected, choice1, answerA, optA1, optA2, optA3);
  }

//
//
  optB1Generator(buttonBselected, choice2, answerB) {
    return ob.opt1Generator(buttonBselected, choice2, answerB);
  }

  optB2Generator(buttonBselected, choice2, answerB, optA1) {
    return ob.opt2Generator(buttonBselected, choice2, answerB, optA1);
  }

  optB3Generator(buttonBselected, choice2, answerB, optA1, optA2) {
    return ob.opt3Generator(buttonBselected, choice2, answerB, optA1, optA2);
  }

  optB4Generator(buttonBselected, choice2, answerB, optA1, optA2, optA3) {
    return ob.opt4Generator(
        buttonBselected, choice2, answerB, optA1, optA2, optA3);
  }

//
  generate() {
    _operation = operationGenerator();
    _var1 = var1Generator(_operation);
    _var2 = var2Generator(_operation, _var1);
    if (_operation == Constants.divide) {
      int temp = _var1;
      _var1 = _var2;
      _var2 = temp;
    }
    
    _result = resultGenerator(_operation, _var1, _var2);
    _choice1 = choice1Selection();
    _choice2 = choice2Selection(_choice1);
    _answerA = ansAGenerator(_choice1, _var1, _operation, _var2, _result);
    _answerB = ansAGenerator(_choice2, _var1, _operation, _var2, _result);
    _buttonASelected = buttonAselected();
    _buttonBSelected = buttonBselected();
    _optA1 = optA1Generator(_buttonASelected, _choice1, _answerA);
    _optA2 = optA2Generator(_buttonASelected, _choice1, _answerA, _optA1);
    _optA3 =
        optA3Generator(_buttonASelected, _choice1, _answerA, _optA1, _optA2);
    _optA4 = optA4Generator(
        _buttonASelected, _choice1, _answerA, _optA1, _optA2, _optA3);

    _optB1 = optB1Generator(_buttonBSelected, _choice2, _answerB);
    _optB2 = optB2Generator(_buttonBSelected, _choice2, _answerB, _optB1);
    _optB3 =
        optB3Generator(_buttonBSelected, _choice2, _answerB, _optB1, _optB2);
    _optB4 = optB4Generator(
        _buttonBSelected, _choice2, _answerB, _optB1, _optB2, _optB3);

    print('CHOICE 1: $_choice1');
    print('CHOICE 2: $_choice2');
    print('Answer A: $_answerA');
    print('Answer B: $_answerB');
  }
  
}
