import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';
import 'dart:math';

class OneBlockQuestions {
  Random random = Random();
  List<String> operations = Constants.symbols;
  /////
  String _operation;
  int _variable1;
  int _variable2;
  int _result;
  dynamic _answer;
  int _buttonSelected;
  int _choiceSelected;
  dynamic _opt1;
  dynamic _opt2;
  dynamic _opt3;
  dynamic _opt4;
  bool _isInCorrect = false;
  bool _opt1Checker;
  bool _opt2Checker;
  bool _opt3Checker;
  bool _opt4Checker;

  dynamic _choiceAnswer = '';

//
  Shadows _shadows1 = Shadows();
  Shadows _shadows2 = Shadows();
  Shadows _shadows3 = Shadows();
  Shadows _shadows4 = Shadows();
//
  int _score = 0;
  bool _absorbOptButtons = false;

  /////
  int get score => _score;
  int get choiceSelected => _choiceSelected;
  int get var1 => _variable1;
  int get var2 => _variable2;
  int get result => _result;
  String get operation => _operation;
  String get choiceAnswer => _choiceAnswer;

  bool get absorbOptButtons => _absorbOptButtons;
  bool get isInCorrect => _isInCorrect;

  setIsInCorrect(bool value) => _isInCorrect = value;

  dynamic get opt1 => _opt1;
  dynamic get opt2 => _opt2;
  dynamic get opt3 => _opt3;
  dynamic get opt4 => _opt4;
  dynamic get answer => _answer;
  Shadows get shadows1 => _shadows1;
  Shadows get shadows2 => _shadows2;
  Shadows get shadows3 => _shadows3;
  Shadows get shadows4 => _shadows4;

  generate() {
    // _operation = operationGenerator();
    _operation = Constants.divide;
    _variable1 = var1Generator(_operation);
    _variable2 = var2Generator(_operation, _variable1);
    print(_operation);
    print('var1 : $_variable1');
    print('var2 : $_variable2');
    if (_operation == Constants.divide) {
      int temp = _variable1;
      _variable1 = _variable2;
      _variable2 = temp;
    }
    print('var1 : $_variable1');
    print('var2 : $_variable2');
    _result = resultGenerator(_operation, _variable1, _variable2);
    _buttonSelected = getButtonSelected();
    _choiceSelected = getChoiceSelected();
    _answer = answerGenerator(
        _choiceSelected, _variable1, _operation, _variable2, _result);
    _opt1 = opt1Generator(_buttonSelected, _choiceSelected, _answer);
    _opt2 = opt2Generator(_buttonSelected, _choiceSelected, _answer, _opt1);
    _opt3 =
        opt3Generator(_buttonSelected, _choiceSelected, _answer, _opt1, _opt2);
    _opt4 = opt4Generator(
        _buttonSelected, _choiceSelected, _answer, _opt1, _opt2, _opt3);
    _opt1Checker = checker(_opt1, _variable1, _variable2, _result);
    _opt2Checker = checker(_opt2, _variable1, _variable2, _result);
    _opt3Checker = checker(_opt3, _variable1, _variable2, _result);
    _opt4Checker = checker(_opt4, _variable1, _variable2, _result);
    /** **/
    _shadows1.set(null);
    _shadows2.set(null);
    _shadows3.set(null);
    _shadows4.set(null);
    _isInCorrect = false;
    _choiceAnswer = '';
    _absorbOptButtons = false;
  }

  answerChecker(
      dynamic opt, dynamic answer, Shadows shadow, Function action) async {
    _absorbOptButtons = true;
    if (_choiceSelected == 1) {
      bool optCheck = checker(opt, _variable1, _variable2, _result);
      if (optCheck == true) {
        _choiceAnswer = '$opt';
        _score++;
        shadow.set(Constants.greenShadow);
        action();
        // await Future.delayed(const Duration(milliseconds: 500), () {
        //   generate();
        // });
      } else {
        shadow.set(Constants.redShadow);
        rightAnsChecker(_opt1Checker, _shadows1);
        rightAnsChecker(_opt2Checker, _shadows2);
        rightAnsChecker(_opt3Checker, _shadows3);
        rightAnsChecker(_opt4Checker, _shadows4);
        _isInCorrect = true;
        print('opt1: $_opt1Checker');
        print('opt2: $_opt2Checker');
        print('opt3: $_opt3Checker');
        print('opt4: $_opt4Checker');
      }
    } else {
      if (opt == answer) {
        shadow.set(Constants.greenShadow);
        _score++;
        action();
        // await Future.delayed(const Duration(milliseconds: 500), () {
        //   generate();
        // });
      } else {
        shadow.set(Constants.redShadow);
        _isInCorrect = true;
        if (_opt1 == answer) _shadows1.set(Constants.greenShadow);
        if (_opt2 == answer) _shadows2.set(Constants.greenShadow);
        if (_opt3 == answer) _shadows3.set(Constants.greenShadow);
        if (_opt4 == answer) _shadows4.set(Constants.greenShadow);
      }
    }
  }

  rightAnsChecker(bool isOpt, Shadows shadow) {
    if (isOpt == true) {
      print(isOpt);
      shadow.set(Constants.greenShadow);
    }
  }

  int option1Generator(restrict, range) {
    int val = random.nextInt(range);
    if (val == restrict)
      return option1Generator(restrict, range);
    else
      return val;
  }

  int option2Generator(restrict1, restrict2, range) {
    int val = random.nextInt(range);
    if (val == restrict1)
      return option2Generator(restrict1, restrict2, range);
    else if (val == restrict2)
      return option2Generator(restrict1, restrict2, range);
    else
      return val;
  }

  setAnswer() {
    _choiceAnswer = '$_answer';
  }

  int option3Generator(restrict1, restrict2, restrict3, range) {
    int val = random.nextInt(range);
    if (val == restrict1)
      return option3Generator(restrict1, restrict2, restrict3, range);
    else if (val == restrict2)
      return option3Generator(restrict1, restrict2, restrict3, range);
    else if (val == restrict3)
      return option3Generator(restrict1, restrict2, restrict3, range);
    else
      return val;
  }

  int option4Generator(restrict1, restrict2, restrict3, restrict4, range) {
    int val = random.nextInt(range);
    if (val == restrict1)
      return option4Generator(
          restrict1, restrict2, restrict3, restrict4, range);
    else if (val == restrict2)
      return option4Generator(
          restrict1, restrict2, restrict3, restrict4, range);
    else if (val == restrict3)
      return option4Generator(
          restrict1, restrict2, restrict3, restrict4, range);
    else if (val == restrict4)
      return option4Generator(
          restrict1, restrict2, restrict3, restrict4, range);
    else
      return val;
  }

  String operationGenerator() {
    return operations[random.nextInt(2)];
  }

  ///////////////////////////////////////////////////////

  int var1Generator(operation) {
    if (operation == Constants.divide)
      return 1 + random.nextInt(9);
    else
      return random.nextInt(10);
  }

  int var2Generator(operation, var1) {
    if (operation == Constants.divide)
      return (1 + random.nextInt(9)) * var1;
    else
      return random.nextInt(10);
  }
  
  ////////////////////////////////////////////////////////

  swap(var1, var2) {
    var1 = var1 + var2;
    var2 = var1 - var2;
    var1 = var1 - var2;
    print('var1: $var1');
    print('var2: $var2');
  }

  int resultGenerator(String operand, int var1, int var2) {
    if (operand == Constants.add)
      return var1 + var2;
    else if (operand == Constants.minus)
      return var1 - var2;
    else if (operand == Constants.multiply)
      return var1 * var2;
    else
      return var1 ~/ var2;
  }

  int getButtonSelected() {
    return random.nextInt(4);
  }

  int getChoiceSelected() {
    return random.nextInt(4);
  }

  dynamic answerGenerator(
      int choice, int var1, String operand, int var2, int result) {
    if (choice == 0)
      return var1;
    else if (choice == 1)
      return operand;
    else if (choice == 2)
      return var2;
    else
      return result;
  }

  dynamic opt1Generator(
      int buttonSelected, int choiceSelected, dynamic answer) {
    if (buttonSelected == 0) {
      return answer;
    } else {
      if (choiceSelected == 1) {
        List<String> temp = [...operations];
        temp.remove(answer);
        return temp[random.nextInt(temp.length)];
      } else
        return option1Generator(answer, 10);
    }
  }

  dynamic opt2Generator(
      int buttonSelected, int choiceSelected, dynamic answer, opt1) {
    if (buttonSelected == 1) {
      return answer;
    } else {
      if (choiceSelected == 1) {
        List<String> temp = [...operations];
        temp.remove(answer);
        temp.remove(opt1);
        return temp[random.nextInt(temp.length)];
      } else {
        return option2Generator(answer, opt1, 10);
      }
    }
  }

  dynamic opt3Generator(
      int buttonSelected, int choiceSelected, dynamic answer, opt1, opt2) {
    if (buttonSelected == 2) {
      return answer;
    } else {
      if (choiceSelected == 1) {
        List<String> temp = [...operations];
        temp.remove(answer);
        temp.remove(opt1);
        temp.remove(opt2);
        return temp[random.nextInt(temp.length)];
      } else {
        return option3Generator(answer, opt1, opt2, 10);
      }
    }
  }

  dynamic opt4Generator(int buttonSelected, int choiceSelected, dynamic answer,
      opt1, opt2, opt3) {
    if (buttonSelected == 3) {
      return answer;
    } else {
      if (choiceSelected == 1) {
        List<String> temp = [...operations];
        temp.remove(answer);
        temp.remove(opt1);
        temp.remove(opt2);
        temp.remove(opt3);
        return temp[random.nextInt(temp.length)];
      } else {
        return option4Generator(answer, opt1, opt2, opt3, 10);
      }
    }
  }

  checker(opt, var1, var2, result) {
    if (opt == Constants.add && var1 + var2 == result)
      return true;
    else if (opt == Constants.minus && var1 - var2 == result)
      return true;
    else if (opt == Constants.multiply && var1 * var2 == result)
      return true;
    else if (opt == Constants.divide && var1 ~/ var2 == result)
      return true;
    else
      return false;
  }
}

class Shadows {
  List<BoxShadow> _shadow;
  void set(List<BoxShadow> shadow) => _shadow = shadow;
  List<BoxShadow> get() => _shadow;
}
