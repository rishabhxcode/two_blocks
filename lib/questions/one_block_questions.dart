import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';
import 'dart:math';

class OneBlockQuestions {
  Random random = Random();
  List<String> operations = Constants.symbols;
  /////
  int _time = 10;
  String _operation;
  int _var1;
  int _var2;
  int _result;
  dynamic _answer;
  int _buttonSelected;
  int _choice;
  dynamic _opt1;
  dynamic _opt2;
  dynamic _opt3;
  dynamic _opt4;
  bool _isInCorrect = false;
  dynamic _opt;

  int _level = 0;
  int _count = 0;

  int _min = 0;
  int _max = 5;

  int _optMin = 0;
  int _optMax = 10;

  dynamic _choiceAnswer = '';
//message
  String _message = '';
  double _messageSize = 0;
  Colour _messageColor = Colour();

//
  Shadows _shadow1 = Shadows();
  Shadows _shadow2 = Shadows();
  Shadows _shadow3 = Shadows();
  Shadows _shadow4 = Shadows();
//
  int _score = 0;
  bool _absorbOptButtons = false;
  int _lives = 3;

  /////
  int get time => _time;
  int get level => _level;
  int get score => _score;
  int get lives => _lives;
  int get choiceSelected => _choice;
  int get var1 => _var1;
  int get var2 => _var2;
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
  Shadows get shadows1 => _shadow1;
  Shadows get shadows2 => _shadow2;
  Shadows get shadows3 => _shadow3;
  Shadows get shadows4 => _shadow4;

  String get message => _message;
  double get messageSize => _messageSize;
  Colour get messageColor => _messageColor;
  dynamic get opt => _opt;

  generate() {
    _count++;
    _operation = operationGenerator();
    _var1 = var1Generator(_operation, min: _min, max: _max);
    _var2 = var2Generator(_operation, _var1, min: _min, max: _max);
    if (_operation == Constants.divide) {
      int temp = _var1;
      _var1 = _var2;
      _var2 = temp;
    }
    _result = resultGenerator(_operation, _var1, _var2);
    _buttonSelected = buttonSelected();
    _choice = getChoiceSelected();
    _answer = answerGenerator(_choice, _var1, _operation, _var2, _result);
    _opt1 = opt1Generator(_buttonSelected, _choice, _answer);
    _opt2 = opt2Generator(_buttonSelected, _choice, _answer, _opt1);
    _opt3 = opt3Generator(_buttonSelected, _choice, _answer, _opt1, _opt2);
    _opt4 =
        opt4Generator(_buttonSelected, _choice, _answer, _opt1, _opt2, _opt3);
    /** **/
    _message = '';
    _messageColor.set(Colors.transparent);
    _messageSize = 0;
    _shadow1.set(null);
    _shadow2.set(null);
    _shadow3.set(null);
    _shadow4.set(null);
    _isInCorrect = false;
    _choiceAnswer = '';
    _absorbOptButtons = false;
    setMinMax(_level);
    if (_count == 2) {
      _level = 1;
    } else if (_count == 20) {
      _level = 2;
    } else if (_count == 30) {
      _level = 3;
    }
    print('ANSWER : $_answer');
  }

  setMinMax(level) {
    if (level == 1) {
      _min = -5;
      _max = 10;
      if (_operation == Constants.divide) {
        _optMin = -25;
        _optMax = 50;
      } else if (_operation == Constants.multiply) {
        _optMin = -25;
        _optMax = 50;
      } else {
        _optMin = -10;
        _optMax = 20;
      }
    } else if (level == 2) {
      _min = 5;
      _max = 10;
      if (_operation == Constants.divide) {
        _optMin = 25;
        _optMax = 200;
      } else if (_operation == Constants.multiply) {
        _optMin = 25;
        _optMax = 200;
      } else {
        _optMin = 10;
        _optMax = 20;
      }
    }
  }

  bool checkDivide(a, b, result) {
    try {
      int res = a ~/ b;
      if (res == result) {
        return true;
      }
    } catch (DivideByZeroException) {
      return false;
    }
    return false;
  }

  bool answerChecker(dynamic ans, choice, var1, var2, result, operation) {
    if (choice != 1) {
      if (choice == 0) {
        if (operation == Constants.add && ans + var2 == result)
          return true;
        else if (operation == Constants.minus && ans - var2 == result)
          return true;
        else if (operation == Constants.divide &&
            checkDivide(ans, var2, result))
          return true;
        else if (operation == Constants.multiply && ans * var2 == result)
          return true;
        else
          return false;
      } else if (choice == 2) {
        if (operation == Constants.add && var1 + ans == result)
          return true;
        else if (operation == Constants.minus && var1 - ans == result)
          return true;
        else if (operation == Constants.divide &&
            checkDivide(var1, ans, result))
          return true;
        else if (operation == Constants.multiply && var1 * ans == result)
          return true;
        else
          return false;
      } else {
        if (operation == Constants.add && var1 + var2 == ans)
          return true;
        else if (operation == Constants.minus && var1 - var2 == ans)
          return true;
        else if (operation == Constants.divide &&
            checkDivide(var1, var2, result))
          return true;
        else if (operation == Constants.multiply && var1 * var2 == ans)
          return true;
        else
          return false;
      }
    } else {
      if (ans == Constants.multiply && var1 * var2 == result)
        return true;
      else if (ans == Constants.minus && var1 - var2 == result)
        return true;
      else if (ans == Constants.add && var1 + var2 == result)
        return true;
      else if (ans == Constants.divide && checkDivide(var1, var2, result))
        return true;
      else
        return false;
    }
  }

  setGreenShadow(selected) {
    if (selected == 0) {
      _shadow1.set(Constants.greenShadow);
    } else if (selected == 1) {
      _shadow2.set(Constants.greenShadow);
    } else if (selected == 2) {
      _shadow3.set(Constants.greenShadow);
    } else
      _shadow4.set(Constants.greenShadow);
  }

  onPressed1(
      {AnimationController controller,
      Function route,
      int time,
      Function generate}) {
    controller.stop();
    _absorbOptButtons = true;
    bool check =
        answerChecker(_opt1, _choice, _var1, _var2, _result, _operation);
    if (check == true) {
      _message = Constants.pass[random.nextInt(4)];
      _messageSize = 24;
      _messageColor.set(Colors.green);
      _choiceAnswer = '$_opt1';
      _score +=
          time - (controller.duration.inSeconds * controller.value).toInt();
      print('SCORE : $_score');
      _shadow1.set(Constants.greenShadow);
      generate();
    } else {
      setGreenShadow(_buttonSelected);
      _lives--;
      _choiceAnswer = '$_answer';
      _message = Constants.fail[random.nextInt(3)];
      _messageSize = 24;
      _messageColor.set(Colors.red);
      _shadow1.set(Constants.redShadow);
      if (_lives == 0) {
        _message = Constants.gameOver;
        _isInCorrect = false;
        Future.delayed(Duration(milliseconds: 1500), () {
          route();
        });
      } else {
        _isInCorrect = true;
      }
    }
  }

  onPressed2(
      {AnimationController controller,
      Function route,
      int time,
      Function generate}) {
    controller.stop();
    _absorbOptButtons = true;
    bool check =
        answerChecker(_opt2, _choice, _var1, _var2, _result, _operation);
    if (check == true) {
      _message = Constants.pass[random.nextInt(4)];
      _messageSize = 24;
      _messageColor.set(Colors.green);
      _choiceAnswer = '$_opt2';
      _score +=
          time - (controller.duration.inSeconds * controller.value).toInt();
      print('SCORE : $_score');
      _shadow2.set(Constants.greenShadow);
      generate();
    } else {
      setGreenShadow(_buttonSelected);
      _lives--;
      _choiceAnswer = '$_answer';
      _message = Constants.fail[random.nextInt(3)];
      _messageSize = 24;
      _messageColor.set(Colors.red);
      _shadow2.set(Constants.redShadow);
      if (_lives == 0) {
        _message = Constants.gameOver;
        _isInCorrect = false;
        Future.delayed(Duration(milliseconds: 1500), () {
          route();
        });
      } else {
        _isInCorrect = true;
      }
    }
  }

  onPressed3(
      {AnimationController controller,
      Function route,
      int time,
      Function generate}) {
    controller.stop();
    _absorbOptButtons = true;
    bool check =
        answerChecker(_opt3, _choice, _var1, _var2, _result, _operation);
    if (check == true) {
      _message = Constants.pass[random.nextInt(4)];
      _messageSize = 24;
      _messageColor.set(Colors.green);
      _choiceAnswer = '$_opt3';
      _score +=
          time - (controller.duration.inSeconds * controller.value).toInt();
      print('SCORE : $_score');
      _shadow3.set(Constants.greenShadow);
      generate();
    } else {
      setGreenShadow(_buttonSelected);
      _lives--;
      _choiceAnswer = '$_answer';

      _message = Constants.fail[random.nextInt(3)];
      _messageSize = 24;
      _messageColor.set(Colors.red);
      _shadow3.set(Constants.redShadow);
      if (_lives == 0) {
        _message = Constants.gameOver;
        _isInCorrect = false;
        Future.delayed(Duration(milliseconds: 1500), () {
          route();
        });
      } else {
        _isInCorrect = true;
      }
    }
  }

  onPressed4(
      {AnimationController controller,
      Function route,
      int time,
      Function generate}) {
    controller.stop();
    _absorbOptButtons = true;
    bool check =
        answerChecker(_opt4, _choice, _var1, _var2, _result, _operation);
    if (check == true) {
      _message = Constants.pass[random.nextInt(4)];
      _messageSize = 24;
      _messageColor.set(Colors.green);
      _choiceAnswer = '$_opt4';
      _score +=
          time - (controller.duration.inSeconds * controller.value).toInt();
      _shadow4.set(Constants.greenShadow);
      generate();
    } else {
      setGreenShadow(_buttonSelected);
      _choiceAnswer = '$_answer';
      _lives--;
      _message = Constants.fail[random.nextInt(3)];
      _messageSize = 24;
      _messageColor.set(Colors.red);
      _shadow4.set(Constants.redShadow);
      if (_lives == 0) {
        _message = Constants.gameOver;
        _isInCorrect = false;
        Future.delayed(Duration(milliseconds: 1500), () {
          route();
        });
      } else {
        _isInCorrect = true;
      }
    }
  }

  int option1Generator(restrict, {int min, int max}) {
    int val = min + random.nextInt(max);
    if (val == restrict)
      return option1Generator(restrict, max: max, min: min);
    else
      return val;
  }

  int option2Generator(restrict1, restrict2, {int min, int max}) {
    int val = min + random.nextInt(max + 1);
    if (val == restrict1)
      return option2Generator(restrict1, restrict2, max: max, min: min);
    else if (val == restrict2)
      return option2Generator(restrict1, restrict2, min: min, max: max);
    else
      return val;
  }

  int option3Generator(restrict1, restrict2, restrict3, {int min, int max}) {
    int val = min + random.nextInt(max + 1);
    if (val == restrict1)
      return option3Generator(restrict1, restrict2, restrict3,
          max: max, min: min);
    else if (val == restrict2)
      return option3Generator(restrict1, restrict2, restrict3,
          max: max, min: min);
    else if (val == restrict3)
      return option3Generator(restrict1, restrict2, restrict3,
          max: max, min: min);
    else
      return val;
  }

  int option4Generator(restrict1, restrict2, restrict3, restrict4,
      {int min, int max}) {
    int val = min + random.nextInt(max + 1);
    if (val == restrict1)
      return option4Generator(restrict1, restrict2, restrict3, restrict4,
          max: max, min: min);
    else if (val == restrict2)
      return option4Generator(restrict1, restrict2, restrict3, restrict4,
          max: max, min: min);
    else if (val == restrict3)
      return option4Generator(restrict1, restrict2, restrict3, restrict4,
          max: max, min: min);
    else if (val == restrict4)
      return option4Generator(restrict1, restrict2, restrict3, restrict4,
          max: max, min: min);
    else
      return val;
  }

  String operationGenerator() {
    return operations[random.nextInt(4)];
  }

  ///////////////////////////////////////////////////////
  int divideVarGen({int min, int max}) {
    int val = min + random.nextInt(max);
    if (val == 0)
      return divideVarGen(min: min, max: max);
    else
      return val;
  }

  int var1Generator(operation, {int min, int max}) {
    if (operation == Constants.divide)
      return divideVarGen(min: min, max: max);
    else
      return min + random.nextInt(max + 1);
  }

  int var2Generator(operation, var1, {int min, int max}) {
    if (operation == Constants.divide)
      return (1 + min + random.nextInt(max)) * var1;
    else
      return min + random.nextInt(max + 1);
  }

  ////////////////////////////////////////////////////////
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

  int buttonSelected() {
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
        return option1Generator(answer, min: _optMin, max: _optMax);
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
        return option2Generator(answer, opt1, min: _optMin, max: _optMax);
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
        return option3Generator(answer, opt1, opt2, min: _optMin, max: _optMax);
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
        return option4Generator(answer, opt1, opt2, opt3,
            min: _optMin, max: _optMax);
      }
    }
  }

  onTimeFinished(double seconds, int time, {Function route}) {
    if (seconds == time) {
      if (_answer == _opt1) _shadow1.set(Constants.greenShadow);
      if (_answer == _opt2) _shadow2.set(Constants.greenShadow);
      if (_answer == _opt3) _shadow3.set(Constants.greenShadow);
      if (_answer == _opt4) _shadow4.set(Constants.greenShadow);
      _choiceAnswer = '$_answer';
      _lives--;
      if (_lives == 0) {
        _message = Constants.gameOver;
        _messageColor.set(Colors.red);
        _messageSize = 30;
        _absorbOptButtons = true;
        route();
      } else {
        _message = Constants.timeUp;
        _messageColor.set(Colors.red);
        _messageSize = 30;
        _isInCorrect = true;
        _absorbOptButtons = true;
      }
    }
  }
}

class Shadows {
  List<BoxShadow> _shadow;
  void set(List<BoxShadow> shadow) => _shadow = shadow;
  List<BoxShadow> get() => _shadow;
}

class Colour {
  Color _color;
  void set(Color color) => _color = color;
  Color get() => _color;
}
