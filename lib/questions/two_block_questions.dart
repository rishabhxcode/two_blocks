import 'package:flutter/material.dart';
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
  int _timesPressed;
  bool _isAabsorbed;
  bool _isBabsorbed;
  dynamic _a;
  dynamic _b;
  //message
  String _message;
  double _messageSize;
  Color _messageColor;
  //colors
  Colour _colorA1 = Colour();
  Colour _colorA2 = Colour();
  Colour _colorA3 = Colour();
  Colour _colorA4 = Colour();
  Colour _colorB1 = Colour();
  Colour _colorB2 = Colour();
  Colour _colorB3 = Colour();
  Colour _colorB4 = Colour();

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
  int get timesPressed => _timesPressed;
  bool get isAabsorbed => _isAabsorbed;
  bool get isBabsorbed => _isBabsorbed;

  //message
  String get messagee => _message;
  double get messageSize => _messageSize;
  Color get messageColor => _messageColor;
  //color
  Colour get colorA1 => _colorA1;
  Colour get colorA2 => _colorA2;
  Colour get colorA3 => _colorA3;
  Colour get colorA4 => _colorA4;
  Colour get colorB1 => _colorB1;
  Colour get colorB2 => _colorB2;
  Colour get colorB3 => _colorB3;
  Colour get colorB4 => _colorB4;

  dynamic get a => _a;
  dynamic get b => _b;

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
    _timesPressed = 0;
    _isAabsorbed = false;
    _isBabsorbed = false;

    _colorA1.set(Colors.transparent);
    _colorA2.set(Colors.transparent);
    _colorA3.set(Colors.transparent);
    _colorA4.set(Colors.transparent);
    _colorB1.set(Colors.transparent);
    _colorB2.set(Colors.transparent);
    _colorB3.set(Colors.transparent);
    _colorB4.set(Colors.transparent);

    print('CHOICE 1: $_choice1');
    print('CHOICE 2: $_choice2');
    print('Answer A: $_answerA');
    print('Answer B: $_answerB');
  }

  bool answerChecker2(
      dynamic a, dynamic b, choice1, choice2, var1, var2, operation, result) {
    if (choice1 == 0) {
      if (choice2 == 1) {
        if (b == Constants.add && a + var2 == result)
          return true;
        else if (b == Constants.minus && a - var2 == result)
          return true;
        else if (b == Constants.multiply && a * var2 == result)
          return true;
        else if (b == Constants.divide && a ~/ var2 == result)
          return true;
        else
          return false;
      } else if (choice2 == 2) {}
    }
  }

  bool answerChecker(
      dynamic a, dynamic b, choice1, choice2, var1, var2, operation, result) {
    if (choice1 != 1 && choice2 != 1) {
      if (choice1 == 0) {
        if (choice2 == 2) {
          if (operation == Constants.divide && a ~/ b == result)
            return true;
          else if (operation == Constants.multiply && a * b == result)
            return true;
          else if (operation == Constants.add && a + b == result)
            return true;
          else if (operation == Constants.minus && a - b == result)
            return true;
          else
            return false;
        } else if (choice2 == 3) {
          if (operation == Constants.divide && a ~/ var2 == b)
            return true;
          else if (operation == Constants.multiply && a * var2 == b)
            return true;
          else if (operation == Constants.add && a + var2 == b)
            return true;
          else if (operation == Constants.minus && a - var2 == b)
            return true;
          else
            return false;
        }
      } else if (choice1 == 2) {
        if (choice2 == 3) {
          if (operation == Constants.divide && var1 ~/ a == b)
            return true;
          else if (operation == Constants.multiply && var1 * a == b)
            return true;
          else if (operation == Constants.add && var1 + a == b)
            return true;
          else if (operation == Constants.minus && var1 - a == b)
            return true;
          else
            return false;
        }
      } else
        return false;
    } else {
      if (choice1 == 1) {
        if (choice2 == 2) {
          if (a == Constants.add && var1 + b == result)
            return true;
          else if (a == Constants.minus && var1 - b == result)
            return true;
          else if (a == Constants.multiply && var1 * b == result)
            return true;
          else if (a == Constants.divide && var1 ~/ b == result)
            return true;
          else
            return false;
        } else if (choice2 == 3) {
          if (a == Constants.add && var1 + var2 == b)
            return true;
          else if (a == Constants.minus && var1 - var2 == b)
            return true;
          else if (a == Constants.multiply && var1 * var2 == b)
            return true;
          else if (a == Constants.divide && var1 ~/ var2 == b)
            return true;
          else
            return false;
        } else
          return false;
      } else if (choice2 == 1) {
        if (b == Constants.add && a + var2 == result)
          return true;
        else if (b == Constants.minus && a - var2 == result)
          return true;
        else if (b == Constants.multiply && a * var2 == result)
          return true;
        else if (b == Constants.divide && a ~/ var2 == result)
          return true;
        else
          return false;
      } else
        return false;
    }
  }

  onPressedA1() {
    _a = _optA1;
    _isAabsorbed = true;
    _colorA1.set(Colors.purple[100]);
    _timesPressed++;
    if (_timesPressed == 2) {
      bool check = answerChecker(
          _a, _b, _choice1, _choice2, _var1, _var2, _operation, _result);
      print('CHECK : $check');
      if (check == true) generate();
    }
  }

  onPressedA2() {
    _a = _optA2;
    _isAabsorbed = true;
    _colorA2.set(Colors.purple[100]);
    _timesPressed++;
    if (_timesPressed == 2) {
      bool check = answerChecker(
          _a, _b, _choice1, _choice2, _var1, _var2, _operation, _result);
      print('CHECK : $check');
      if (check == true) generate();
    }
  }

  onPressedA3() {
    _a = _optA3;
    _isAabsorbed = true;
    _timesPressed++;
    _colorA3.set(Colors.purple[100]);
    if (_timesPressed == 2) {
      bool check = answerChecker(
          _a, _b, _choice1, _choice2, _var1, _var2, _operation, _result);
      print('CHECK : $check');
      if (check == true) generate();
    }
  }

  onPressedA4() {
    _a = _optA4;
    _isAabsorbed = true;
    _timesPressed++;
    _colorA4.set(Colors.purple[100]);
    if (_timesPressed == 2) {
      bool check = answerChecker(
          _a, _b, _choice1, _choice2, _var1, _var2, _operation, _result);
      print('CHECK : $check');
      if (check == true) generate();
    }
  }

  onPressedB1() {
    _b = _optB1;
    _isBabsorbed = true;
    _timesPressed++;
    _colorB1.set(Colors.blue[100]);
    if (_timesPressed == 2) {
      bool check = answerChecker(
          _a, _b, _choice1, _choice2, _var1, _var2, _operation, _result);
      print('CHECK : $check');
      if (check == true) generate();
    }
  }

  onPressedB2() {
    _b = _optB2;
    _isBabsorbed = true;
    _timesPressed++;
    _colorB2.set(Colors.blue[100]);
    if (_timesPressed == 2) {
      bool check = answerChecker(
          _a, _b, _choice1, _choice2, _var1, _var2, _operation, _result);
      print('CHECK : $check');
      if (check == true) generate();
    }
  }

  onPressedB3() {
    _b = _optB3;
    _isBabsorbed = true;
    _timesPressed++;
    _colorB3.set(Colors.blue[100]);
    if (_timesPressed == 2) {
      bool check = answerChecker(
          _a, _b, _choice1, _choice2, _var1, _var2, _operation, _result);
      print('CHECK : $check');
      if (check == true) generate();
    }
  }

  onPressedB4() {
    _b = _optB4;
    _isBabsorbed = true;
    _timesPressed++;
    _colorB4.set(Colors.blue[100]);
    if (_timesPressed == 2) {
      bool check = answerChecker(
          _a, _b, _choice1, _choice2, _var1, _var2, _operation, _result);
      print('CHECK : $check');
      if (check == true) generate();
    }
  }
}
