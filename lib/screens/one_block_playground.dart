import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';
import 'package:two_blocks/questions/one_block_questions.dart';

import 'package:two_blocks/widgets/choice_container.dart';
import 'package:two_blocks/widgets/flat_num_button.dart';
import 'package:two_blocks/widgets/neu_button_widget.dart';
import 'package:two_blocks/widgets/neu_container.dart';

class OneBlockPlayGround extends StatefulWidget {
  @override
  _OneBlockPlayGroundState createState() => _OneBlockPlayGroundState();
}

class _OneBlockPlayGroundState extends State<OneBlockPlayGround> {
  OneBlockQuestions ob = OneBlockQuestions();

  String operation;
  int var1;
  int var2;
  int result;
  dynamic answer;
  int buttonSelected;
  int choiceSelected;
  dynamic opt1;
  dynamic opt2;
  dynamic opt3;
  dynamic opt4;
  bool _isInCorrect = false;
  bool _opt1Checker;
  bool _opt2Checker;
  bool _opt3Checker;
  bool _opt4Checker;

  dynamic choiceAnswer = '';

//
  Shadows shadows1 = Shadows();
  Shadows shadows2 = Shadows();
  Shadows shadows3 = Shadows();
  Shadows shadows4 = Shadows();
//
  int _score = 0;
  bool _absorbOptButtons = false;
//
  generate() {
    operation = ob.operationGenerator();
    // var1 = ob.var1Generator();
    var1 = 0;
    // var2 = ob.var2Generator();
    var2 = 1;
    result = ob.resultGenerator(operation, var1, var2);
    buttonSelected = ob.buttonSelected();
    // choiceSelected = ob.choiceSelected();
    choiceSelected = 0;
    answer = ob.answerGenerator(choiceSelected, var1, operation, var2, result);
    opt1 = ob.opt1Generator(buttonSelected, choiceSelected, answer);
    opt2 = ob.opt2Generator(buttonSelected, choiceSelected, answer, opt1);
    opt3 = ob.opt3Generator(buttonSelected, choiceSelected, answer, opt1, opt2);
    opt4 = ob.opt4Generator(
        buttonSelected, choiceSelected, answer, opt1, opt2, opt3);
    _opt1Checker = checker(opt1, var1, var2, result);
    _opt2Checker = checker(opt2, var1, var2, result);
    _opt3Checker = checker(opt3, var1, var2, result);
    _opt4Checker = checker(opt4, var1, var2, result);
    /** **/
    shadows1.set(null);
    shadows2.set(null);
    shadows3.set(null);
    shadows4.set(null);
    _isInCorrect = false;
    choiceAnswer = '';
    _absorbOptButtons = false;
    setState(() {});
  }

  setAnswer() {
    setState(() {
      choiceAnswer = '$answer';
    });
  }

  answerChecker(dynamic opt, dynamic answer, Shadows shadow) {
    _absorbOptButtons = true;
    if (choiceSelected == 1) {
      bool optCheck = checker(opt, var1, var2, result);
      if (optCheck == true) {
        choiceAnswer = '$opt';
        shadow.set(Constants.greenShadow);
        Future.delayed(const Duration(milliseconds: 500), () {
          generate();
        });
      } else {
        shadow.set(Constants.redShadow);
        rightAnsChecker(_opt1Checker, shadows1);
        rightAnsChecker(_opt2Checker, shadows2);
        rightAnsChecker(_opt3Checker, shadows3);
        rightAnsChecker(_opt4Checker, shadows4);
        _isInCorrect = true;
        print('opt1: $_opt1Checker');
        print('opt2: $_opt2Checker');
        print('opt3: $_opt3Checker');
        print('opt4: $_opt4Checker');
      }
    } else {
      if (opt == answer) {
        shadow.set(Constants.greenShadow);
        Future.delayed(const Duration(milliseconds: 500), () {
          generate();
        });
      } else {
        shadow.set(Constants.redShadow);
        _isInCorrect = true;
        if (opt1 == answer) shadows1.set(Constants.greenShadow);
        if (opt2 == answer) shadows2.set(Constants.greenShadow);
        if (opt3 == answer) shadows3.set(Constants.greenShadow);
        if (opt4 == answer) shadows4.set(Constants.greenShadow);
      }
    }
    setState(() {});
  }

  rightAnsChecker(bool isOpt, Shadows shadow) {
    if (isOpt == true) shadow.set(Constants.greenShadow);
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

  @override
  void initState() {
    generate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build::OneBlockPlayGround()');
    return Scaffold(
      backgroundColor: Constants.BGColor,
      appBar: AppBar(
        backgroundColor: Constants.BGColor,
        title: Text('Playground'),
        elevation: 0,
        leading: Center(
            child: Text(
          'logo',
          style: TextStyle(fontSize: 10),
        )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ///// HEADER ////////////////
          Container(
            // color: Colors.yellow,
            height: 50,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '  High score:',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text('  Score: $_score')
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  child: Wrap(
                    children: <Widget>[
                      Icon(Icons.favorite),
                      Icon(Icons.favorite),
                      Icon(Icons.favorite)
                    ],
                  ),
                )),
                Expanded(
                  child: Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: Text('Timer'),
                  ),
                ),
              ],
            ),
          ),
          /////////////////////////////////
          Expanded(
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
                      : Text('$var2', style: Constants.textStyle2),
                  Text('=', style: Constants.textStyle2),
                  choiceSelected == 3
                      ? ChoiceContainer(
                          choiceAnswer: choiceAnswer,
                        )
                      : Text('$result', style: Constants.textStyle2)
                ],
              ),
            ),
          ),

          Expanded(
            child: Container(
              alignment: Alignment.center,
              // color: Colors.cyan,
              child: AbsorbPointer(
                absorbing: _absorbOptButtons,
                child: NeuContainer(
                  height: 200.5,
                  width: 200.5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatNumButton(
                              text: '$opt1',
                              boxShadows: shadows1.get(),
                              onTap: () {
                                setAnswer();
                                answerChecker(opt1, answer, shadows1);
                                print(checker(opt1, var1, var2, result));
                              }),
                          Container(
                            height: 80,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: 0.3,
                              width: 0.5,
                            ),
                          ),
                          FlatNumButton(
                            text: '$opt2',
                            boxShadows: shadows2.get(),
                            onTap: () {
                              setAnswer();
                              answerChecker(opt2, answer, shadows2);
                              print(checker(opt2, var1, var2, result));
                            },
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            child: Divider(
                              thickness: 0.5,
                              height: 0.5,
                            ),
                          ),
                          Container(
                            width: 80,
                            child: Divider(
                              thickness: 0.5,
                              height: 0.5,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatNumButton(
                              text: '$opt3',
                              boxShadows: shadows3.get(),
                              onTap: () {
                                setAnswer();
                                answerChecker(opt3, answer, shadows3);
                                print(checker(opt3, var1, var2, result));
                              }),
                          Container(
                            height: 80,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: 0.3,
                              width: 0.5,
                            ),
                          ),
                          FlatNumButton(
                            text: '$opt4',
                            boxShadows: shadows4.get(),
                            onTap: () {
                              setAnswer();
                              answerChecker(opt4, answer, shadows4);
                              print(checker(opt4, var1, var2, result));
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            alignment: Alignment.centerRight,
            child: _isInCorrect
                ? NeuButtonWidget(
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
                    onTap: () {
                      setState(() {
                        generate();
                        _isInCorrect = false;
                      });
                    },
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}

class Shadows {
  List<BoxShadow> _shadow;
  void set(List<BoxShadow> shadow) => _shadow = shadow;
  List<BoxShadow> get() => _shadow;
}
