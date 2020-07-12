import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';
import 'package:two_blocks/logic/save_and_get.dart';
import 'package:two_blocks/questions/one_block_questions.dart';
import 'dart:math';

class TwoBlockQuestions {
  OneBlockQuestions ob = OneBlockQuestions();
  Random random = Random();

  int _lives = 3;

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

  bool _isAabsorbed;
  bool _isBabsorbed;
  dynamic _a;
  dynamic _b;
  //message
  String _message;
  double _messageSize;
  Colour _messageColor = Colour();
  //
  String _choice1Ans;
  String _choice2Ans;

  //colors
  Colour _colorA1 = Colour();
  Colour _colorA2 = Colour();
  Colour _colorA3 = Colour();
  Colour _colorA4 = Colour();
  Colour _colorB1 = Colour();
  Colour _colorB2 = Colour();
  Colour _colorB3 = Colour();
  Colour _colorB4 = Colour();

  bool _isInCorrect;

  Shadows _shadowA1 = Shadows();
  Shadows _shadowA2 = Shadows();
  Shadows _shadowA3 = Shadows();
  Shadows _shadowA4 = Shadows();
  Shadows _shadowB1 = Shadows();
  Shadows _shadowB2 = Shadows();
  Shadows _shadowB3 = Shadows();
  Shadows _shadowB4 = Shadows();

  int _score = 0;
  int _highScore = 0;

  bool _isAPressed;
  bool _isBPressed;

  bool _isInit = false;

  int _level = 0;
  int _count = 0;
  int _var1min = 0;
  int _var2min = 0;
  int _var1max = 5;
  int _var2max = 5;

  int _optMin = 0;
  int _optMax = 10;

  int get lives => _lives;
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

  bool get isAabsorbed => _isAabsorbed;
  bool get isBabsorbed => _isBabsorbed;

  //message
  String get message => _message;
  double get messageSize => _messageSize;
  Colour get messageColor => _messageColor;
  //
  String get choice1Ans => _choice1Ans;
  String get choice2Ans => _choice2Ans;
  //color
  Colour get colorA1 => _colorA1;
  Colour get colorA2 => _colorA2;
  Colour get colorA3 => _colorA3;
  Colour get colorA4 => _colorA4;
  Colour get colorB1 => _colorB1;
  Colour get colorB2 => _colorB2;
  Colour get colorB3 => _colorB3;
  Colour get colorB4 => _colorB4;

  bool get isInCorrect => _isInCorrect;

  Shadows get shadowA1 => _shadowA1;
  Shadows get shadowA2 => _shadowA2;
  Shadows get shadowA3 => _shadowA3;
  Shadows get shadowA4 => _shadowA4;
  Shadows get shadowB1 => _shadowB1;
  Shadows get shadowB2 => _shadowB2;
  Shadows get shadowB3 => _shadowB3;
  Shadows get shadowB4 => _shadowB4;

  bool get isAPressed => _isAPressed;
  bool get isBPressed => _isBPressed;

  int get score => _score;
  int get highScore => _highScore;

  dynamic get a => _a;
  dynamic get b => _b;

  int get level => _level;
  int get count => _count;

  SaveAndGet sharedPref = SaveAndGet();

  getHighScore() async {
    _highScore = await sharedPref.getTwoBlockScore() ?? 0;
    print('HIGH SCORE : $_highScore');
  }

  saveHighScore() async {
    if (_score >= _highScore) {
      sharedPref.saveTwoBlockScore(score);
      _highScore = _score;
      print('SCORE : $_score');
    }
  }

  String operationGenerator() {
    return ob.operationGenerator();
  }

  int var1Generator(operation) {
    return ob.var1Generator(operation, min: _var1min, max: _var1max);
  }

  int var2Generator(operation, var1) {
    return ob.var2Generator(operation, var1, min: _var2min, max: _var2max);
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
    return ob.opt1Generator(buttonAselected, choice1, answerA,
        max: _optMax, min: _optMin);
  }

  optA2Generator(buttonAselected, choice1, answerA, optA1) {
    return ob.opt2Generator(buttonAselected, choice1, answerA, optA1,
        max: _optMax, min: _optMin);
  }

  optA3Generator(buttonAselected, choice1, answerA, optA1, optA2) {
    return ob.opt3Generator(buttonAselected, choice1, answerA, optA1, optA2,
        max: _optMax, min: _optMin);
  }

  optA4Generator(buttonAselected, choice1, answerA, optA1, optA2, optA3) {
    return ob.opt4Generator(
        buttonAselected, choice1, answerA, optA1, optA2, optA3,
        max: _optMax, min: _optMin);
  }

//
//
  optB1Generator(buttonBselected, choice2, answerB) {
    return ob.opt1Generator(buttonBselected, choice2, answerB,
        max: _optMax, min: _optMin);
  }

  optB2Generator(buttonBselected, choice2, answerB, optA1) {
    return ob.opt2Generator(buttonBselected, choice2, answerB, optA1,
        max: _optMax, min: _optMin);
  }

  optB3Generator(buttonBselected, choice2, answerB, optA1, optA2) {
    return ob.opt3Generator(buttonBselected, choice2, answerB, optA1, optA2,
        max: _optMax, min: _optMin);
  }

  optB4Generator(buttonBselected, choice2, answerB, optA1, optA2, optA3) {
    return ob.opt4Generator(
        buttonBselected, choice2, answerB, optA1, optA2, optA3,
        max: _optMax, min: _optMin);
  }

//

  generate() {
    if (_isInit == false) {
      getHighScore();
    }
    print(_isInit);
    _isInit = true;
    _isInCorrect = false;
    // _operation = operationGenerator();
    _operation = Constants.divide;
    // _var1 = var1Generator(_operation);
    _var1 = 1;
    // _var2 = var2Generator(_operation, _var1);
    _var2 = 1;
    if (_operation == Constants.divide) {
      int temp = _var1;
      _var1 = _var2;
      _var2 = temp;
    }
    _result = resultGenerator(_operation, _var1, _var2);
    // _choice1 = choice1Selection();
    _choice1 = 2;
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
    _isAPressed = false;
    _isBPressed = false;
    _isAabsorbed = false;
    _isBabsorbed = false;

    _message = '';
    _messageSize = 0;
    _choice1Ans = '';
    _choice2Ans = '';
    // _messageColor.set(Colors.transparent);

    _colorA1.set(Colors.transparent);
    _colorA2.set(Colors.transparent);
    _colorA3.set(Colors.transparent);
    _colorA4.set(Colors.transparent);
    _colorB1.set(Colors.transparent);
    _colorB2.set(Colors.transparent);
    _colorB3.set(Colors.transparent);
    _colorB4.set(Colors.transparent);
    setMinMax(_level);
    if (_count == 3) {
      _level = 1;
    } else if (_count == 6) {
      _level = 2;
    } else if (_count == 10) {
      _level = 3;
    } else if (_count == 17) {
      _level = 4;
    } else if (_count == 23) {
      _level = 5;
    } else if (_count == 29) {
      _level = 6;
    } else if (_count == 38) {
      _level = 7;
    } else if (_count == 46) {
      _level = 8;
    } else if (_count == 54) {
      _level = 9;
    } else if (_count == 64) {
      _level = 10;
    } else if (_count == 80) {
      _level = 11;
    }

    _shadowA1.set(null);
    _shadowA2.set(null);
    _shadowA3.set(null);
    _shadowA4.set(null);
    _shadowB1.set(null);
    _shadowB2.set(null);
    _shadowB3.set(null);
    _shadowB4.set(null);

    print('CHOICE 1: $_choice1');
    print('CHOICE 2: $_choice2');
    print('Answer A: $_answerA');
    print('Answer B: $_answerB');
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

//
  bool answerChecker(
      dynamic a, dynamic b, choice1, choice2, var1, var2, operation, result) {
    if (choice1 != 1 && choice2 != 1) {
      if (choice1 == 0) {
        if (choice2 == 2) {
          if (operation == Constants.divide && checkDivide(a, b, result))
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
          if (operation == Constants.divide && checkDivide(a, var2, b))
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
          if (operation == Constants.divide && checkDivide(var1, a, b))
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
          else if (a == Constants.divide && checkDivide(var1, b, result))
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
          else if (a == Constants.divide && checkDivide(var1, var2, b))
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
        else if (b == Constants.divide && checkDivide(a, var2, result))
          return true;
        else
          return false;
      } else
        return false;
    }
  }

  setATransparent() {
    _colorA1.set(Colors.transparent);
    _colorA2.set(Colors.transparent);
    _colorA3.set(Colors.transparent);
    _colorA4.set(Colors.transparent);
  }

  setBTransparent() {
    _colorB1.set(Colors.transparent);
    _colorB2.set(Colors.transparent);
    _colorB3.set(Colors.transparent);
    _colorB4.set(Colors.transparent);
  }

  setAShadow(buttonASelected) {
    if (buttonASelected == 0) {
      _shadowA1.set(Constants.greenShadow);
    } else if (buttonASelected == 1) {
      _shadowA2.set(Constants.greenShadow);
    } else if (buttonASelected == 2) {
      _shadowA3.set(Constants.greenShadow);
    } else
      _shadowA4.set(Constants.greenShadow);
  }

  setBShadow(buttonBSelected) {
    if (buttonBSelected == 0) {
      _shadowB1.set(Constants.greenShadow);
    } else if (buttonBSelected == 1) {
      _shadowB2.set(Constants.greenShadow);
    } else if (buttonBSelected == 2) {
      _shadowB3.set(Constants.greenShadow);
    } else
      _shadowB4.set(Constants.greenShadow);
  }

  onPressedA1(
      {Function gen,
      AnimationController controller,
      int time,
      Function route}) {
    setATransparent();
    _colorA1.set(Colors.purple[100]);
    _a = _optA1;
    _isAPressed = true;
    _choice1Ans = '$_optA1';
    if (_isAPressed && _isBPressed) {
      _isAabsorbed = true;
      _isBabsorbed = true;
      _messageSize = 30;
      bool check = answerChecker(
          _a, _b, _choice1, _choice2, _var1, _var2, _operation, _result);
      print('CHECK : $check');
      if (check == true) {
        _count++;
        _score +=
            time - (controller.duration.inSeconds * controller.value).toInt();
        _message = Constants.pass[random.nextInt(3)];
        _messageColor.set(Colors.green);
        saveHighScore();
        gen();
      } else {
        _isInCorrect = true;
        _lives--;
        controller.stop();
        _choice2Ans = '$_answerB';
        _choice1Ans = '$_answerA';
        _message = Constants.fail[random.nextInt(3)];
        _messageColor.set(Colors.red);
        _colorA1.set(Colors.transparent);
        if (_lives == 0) {
          _message = Constants.gameOver;
          _isInCorrect = false;
          Future.delayed(Duration(milliseconds: 1500), () {
            route();
          });
        } else {
          _isInCorrect = true;
        }
        setAShadow(_buttonASelected);
        setBShadow(_buttonBSelected);
        _message = Constants.wrong;
      }
    }
  }

  onPressedA2(
      {Function gen,
      AnimationController controller,
      int time,
      Function route}) {
    setATransparent();
    _colorA2.set(Colors.purple[100]);
    _a = _optA2;
    _isAPressed = true;
    _choice1Ans = '$_optA2';
    if (_isAPressed && _isBPressed) {
      _isAabsorbed = true;
      _isBabsorbed = true;
      _messageSize = 30;
      bool check = answerChecker(
          _a, _b, _choice1, _choice2, _var1, _var2, _operation, _result);
      print('CHECK : $check');
      if (check == true) {
        _count++;
        // _score++;
        _score +=
            time - (controller.duration.inSeconds * controller.value).toInt();
        _message = Constants.pass[random.nextInt(3)];
        _messageColor.set(Colors.green);
        saveHighScore();
        gen();
      } else {
        _isInCorrect = true;
        controller.stop();
        _lives--;
        _choice2Ans = '$_answerB';
        _choice1Ans = '$_answerA';
        _message = Constants.fail[random.nextInt(3)];
        _messageColor.set(Colors.red);
        setAShadow(_buttonASelected);
        setBShadow(_buttonBSelected);
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
  }

  onPressedA3(
      {Function gen,
      AnimationController controller,
      int time,
      Function route}) {
    setATransparent();
    _colorA3.set(Colors.purple[100]);
    _a = _optA3;
    _isAPressed = true;
    _choice1Ans = '$_optA3';
    if (_isAPressed && _isBPressed) {
      _isAabsorbed = true;
      _isBabsorbed = true;
      _messageSize = 30;
      bool check = answerChecker(
          _a, _b, _choice1, _choice2, _var1, _var2, _operation, _result);
      print('CHECK : $check');
      if (check == true) {
        _count++;
        // _score++;
        _score +=
            time - (controller.duration.inSeconds * controller.value).toInt();
        _message = Constants.pass[random.nextInt(3)];
        _messageColor.set(Colors.green);
        saveHighScore();
        gen();
      } else {
        _isInCorrect = true;
        controller.stop();
        _lives--;
        _choice2Ans = '$_answerB';
        _choice1Ans = '$_answerA';
        setAShadow(_buttonASelected);
        setBShadow(_buttonBSelected);
        _message = Constants.fail[random.nextInt(3)];
        _messageColor.set(Colors.red);
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
  }

  onPressedA4(
      {Function gen,
      AnimationController controller,
      int time,
      Function route}) {
    setATransparent();
    _colorA4.set(Colors.purple[100]);
    _a = _optA4;
    _isAPressed = true;
    _choice1Ans = '$_optA4';
    if (_isAPressed && _isBPressed) {
      _isAabsorbed = true;
      _isBabsorbed = true;
      _messageSize = 30;
      bool check = answerChecker(
          _a, _b, _choice1, _choice2, _var1, _var2, _operation, _result);
      print('CHECK : $check');
      if (check == true) {
        _count++;
        // _score++;
        _score +=
            time - (controller.duration.inSeconds * controller.value).toInt();
        _message = Constants.pass[random.nextInt(3)];
        _messageColor.set(Colors.green);
        saveHighScore();
        gen();
      } else {
        _isInCorrect = true;
        controller.stop();
        _lives--;
        _choice2Ans = '$_answerB';
        _choice1Ans = '$_answerA';
        setAShadow(_buttonASelected);
        setBShadow(_buttonBSelected);
        _message = Constants.fail[random.nextInt(3)];
        _messageColor.set(Colors.red);
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
  }

  onPressedB1(
      {Function gen,
      AnimationController controller,
      int time,
      Function route}) {
    setBTransparent();
    _colorB1.set(Colors.blue[100]);
    _b = _optB1;
    _isBPressed = true;
    _choice2Ans = '$_optB1';
    if (_isAPressed && _isBPressed) {
      _isAabsorbed = true;
      _isBabsorbed = true;
      _messageSize = 30;
      bool check = answerChecker(
          _a, _b, _choice1, _choice2, _var1, _var2, _operation, _result);
      print('CHECK : $check');
      if (check == true) {
        _count++;
        // _score++;
        _score +=
            time - (controller.duration.inSeconds * controller.value).toInt();
        _message = Constants.pass[random.nextInt(3)];
        _messageColor.set(Colors.green);
        saveHighScore();
        gen();
      } else {
        _isInCorrect = true;
        controller.stop();
        _lives--;
        _choice2Ans = '$_answerB';
        _choice1Ans = '$_answerA';
        setBShadow(_buttonBSelected);
        setAShadow(_buttonASelected);
        _message = Constants.fail[random.nextInt(3)];
        _messageColor.set(Colors.red);
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
  }

  onPressedB2(
      {Function gen,
      AnimationController controller,
      int time,
      Function route}) {
    setBTransparent();
    _colorB2.set(Colors.blue[100]);
    _b = _optB2;
    _isBPressed = true;
    _choice2Ans = '$_optB2';
    if (_isAPressed && _isBPressed) {
      _isAabsorbed = true;
      _isBabsorbed = true;
      _messageSize = 30;
      bool check = answerChecker(
          _a, _b, _choice1, _choice2, _var1, _var2, _operation, _result);
      print('CHECK : $check');
      if (check == true) {
        _count++;
        // _score++;
        _score +=
            time - (controller.duration.inSeconds * controller.value).toInt();
        _message = Constants.pass[random.nextInt(3)];
        _messageColor.set(Colors.green);
        saveHighScore();
        gen();
      } else {
        _isInCorrect = true;
        controller.stop();
        _lives--;
        _choice2Ans = '$_answerB';
        _choice1Ans = '$_answerA';
        setBShadow(_buttonBSelected);
        setAShadow(_buttonASelected);
        _message = Constants.fail[random.nextInt(3)];
        _messageColor.set(Colors.red);
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
  }

  onPressedB3(
      {Function gen,
      AnimationController controller,
      int time,
      Function route}) {
    setBTransparent();
    _colorB3.set(Colors.blue[100]);
    _b = _optB3;
    _isBPressed = true;

    _choice2Ans = '$_optB3';

    if (_isAPressed && _isBPressed) {
      _isAabsorbed = true;
      _isBabsorbed = true;
      _messageSize = 30;
      bool check = answerChecker(
          _a, _b, _choice1, _choice2, _var1, _var2, _operation, _result);
      print('CHECK : $check');
      if (check == true) {
        _count++;
        // _score++;
        _score +=
            time - (controller.duration.inSeconds * controller.value).toInt();
        _message = Constants.pass[random.nextInt(3)];
        _messageColor.set(Colors.green);
        saveHighScore();
        gen();
      } else {
        _isInCorrect = true;
        controller.stop();
        _lives--;
        _choice2Ans = '$_answerB';
        _choice1Ans = '$_answerA';
        setBShadow(_buttonBSelected);
        setAShadow(_buttonASelected);
        _message = Constants.fail[random.nextInt(3)];
        _messageColor.set(Colors.red);
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
  }

  onPressedB4(
      {Function gen,
      AnimationController controller,
      int time,
      Function route}) {
    setBTransparent();
    _colorB4.set(Colors.blue[100]);
    _b = _optB4;
    _isBPressed = true;
    _choice2Ans = '$_optB4';
    if (_isAPressed && _isBPressed) {
      _isAabsorbed = true;
      _isBabsorbed = true;
      _messageSize = 30;
      bool check = answerChecker(
          _a, _b, _choice1, _choice2, _var1, _var2, _operation, _result);
      print('CHECK : $check');
      if (check == true) {
        _count++;
        // _score++;
        _score +=
            time - (controller.duration.inSeconds * controller.value).toInt();
        _message = Constants.pass[random.nextInt(3)];
        _messageColor.set(Colors.green);
        saveHighScore();
        gen();
      } else {
        _isInCorrect = true;
        controller.stop();
        _lives--;
        _choice2Ans = '$_answerB';
        _choice1Ans = '$_answerA';
        setBShadow(_buttonBSelected);
        setAShadow(_buttonASelected);
        _message = Constants.fail[random.nextInt(3)];
        _messageColor.set(Colors.red);
        if (_lives == 0) {
          _isInCorrect = false;
          _message = Constants.gameOver;

          Future.delayed(Duration(milliseconds: 1500), () {
            route();
          });

          _isInCorrect = true;
        }
      }
    }
  }

  onTimeFinished(double seconds, int time, {Function route}) {
    if (seconds == time) {
      if (_answerA == _optA1) shadowA1.set(Constants.greenShadow);
      if (_answerA == _optA2) shadowA2.set(Constants.greenShadow);
      if (_answerA == _optA3) shadowA3.set(Constants.greenShadow);
      if (_answerA == _optA4) shadowA4.set(Constants.greenShadow);
      if (_answerB == _optB1) shadowB1.set(Constants.greenShadow);
      if (_answerB == _optB2) shadowB2.set(Constants.greenShadow);
      if (_answerB == _optB3) shadowB3.set(Constants.greenShadow);
      if (_answerB == _optB4) shadowB4.set(Constants.greenShadow);
      _choice1Ans = '$_answerA';
      _choice2Ans = '$_answerB';
      _lives--;
      print('LIVES: $_lives');
      if (_lives == 0) {
        print('GAME OVER: TIME UP');
        _message = Constants.gameOver;
        _messageColor.set(Colors.red);
        _messageSize = 30;
        _isAabsorbed = true;
        _isBabsorbed = true;
        route();
      } else {
        _message = Constants.timeUp;
        _messageColor.set(Colors.red);
        _messageSize = 30;
        _isInCorrect = true;
        _isAabsorbed = true;
        _isBabsorbed = true;
      }
    }
  }

  setMinMax(level) {
    if (level == 0) {
      _var1min = 0;
      _var1max = 5;
      _var2min = 0;
      _var2max = 5;
      if (_operation == Constants.divide || _operation == Constants.multiply) {
        _optMin = 0;
        _optMax = 25; //25
      } else {
        _optMin = 0;
        _optMax = 10; //10
      }
    } else if (level == 1) {
      //3
      _var1min = -5;
      _var1max = 5; //0
      _var2min = 0;
      _var2max = 5; //5
      if (_operation == Constants.divide || _operation == Constants.multiply) {
        _optMin = -25;
        _optMax = 50; //25
      } else {
        _optMin = -10;
        _optMax = 20; //10
      }
    } else if (level == 2) {
      //6
      _var1min = -5;
      _var1max = 5; //0
      _var2min = -5;
      _var2max = 5; //0
      if (_operation == Constants.divide || _operation == Constants.multiply) {
        _optMin = -25;
        _optMax = 50; //25
      } else {
        _optMin = -10;
        _optMax = 20; //10
      }
    } else if (level == 3) {
      //10
      _var1min = -5;
      _var1max = 10; //5
      _var2min = -5;
      _var2max = 10; //5
      if (_operation == Constants.divide || _operation == Constants.multiply) {
        _optMin = -25;
        _optMax = 50; //25
      } else {
        _optMin = -10;
        _optMax = 20; //10
      }
    } else if (level == 4) {
      //17
      _var1min = 0;
      _var1max = 10; //10
      _var2min = 0;
      _var2max = 10; //10
      if (_operation == Constants.divide || _operation == Constants.multiply) {
        _optMin = 0;
        _optMax = 100; //100
      } else {
        _optMin = 0;
        _optMax = 20; //20
      }
    } else if (level == 5) {
      //23
      _var1min = -10;
      _var1max = 10; //0
      _var2min = 0;
      _var2max = 10; //10
      if (_operation == Constants.divide || _operation == Constants.multiply) {
        _optMin = -100;
        _optMax = 200; //100
      } else {
        _optMin = -10;
        _optMax = 20; //10
      }
    } else if (level == 6) {
      //29
      _var1min = 0;
      _var1max = 10; //10
      _var2min = -10;
      _var2max = 10; //0
      if (_operation == Constants.divide || _operation == Constants.multiply) {
        _optMin = -100;
        _optMax = 100; //0
      } else {
        _optMin = -10;
        _optMax = 20; //10
      }
    } else if (level == 7) {
      //38
      _var1min = -10;
      _var1max = 20; //10
      _var2min = -10;
      _var2max = 20; //10
      if (_operation == Constants.divide || _operation == Constants.multiply) {
        _optMin = -100;
        _optMax = 500; //400
      } else {
        _optMin = -20;
        _optMax = 60; //40
      }
    } else if (level == 8) {
      //46
      _var1min = 10;
      _var1max = 10; //20
      _var2min = 0;
      _var2max = 10; //10
      if (_operation == Constants.divide || _operation == Constants.multiply) {
        _optMin = 0;
        _optMax = 200;
      } else {
        _optMin = 0;
        _optMax = 20;
      }
    } else if (level == 9) {
      //54
      _var1min = 0;
      _var1max = 10;
      _var2min = -20;
      _var2max = 10; //-10
      if (_operation == Constants.divide || _operation == Constants.multiply) {
        _optMin = -200;
        _optMax = 100; //-100
      } else {
        _optMin = -20;
        _optMax = 30; //10
      }
    } else if (level == 10) {
      //64
      _var1min = -20;
      _var1max = 40; //20
      _var2min = -20;
      _var2max = 40; //20
      if (_operation == Constants.divide || _operation == Constants.multiply) {
        _optMin = -400;
        _optMax = 800; //400
      } else {
        _optMin = -40;
        _optMax = 80; //40
      }
    } else {
      // 80
      _var1min = -50;
      _var1max = 100; //50
      _var2min = -50;
      _var2max = 100; //50
      if (_operation == Constants.divide || _operation == Constants.multiply) {
        _optMin = -2500;
        _optMax = 5000; //2500
      } else {
        _optMin = -100;
        _optMax = 200; //100
      }
    }
  }
}
