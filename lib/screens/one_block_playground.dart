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
  OneBlockQuestions oneBlock = OneBlockQuestions();

  String operation;
  int var1;
  int var2;
  int result;
  int choice;
  dynamic answer;
  int buttonSelected;
  dynamic opt1;
  dynamic opt2;
  String choiceAnswer;

//
  Shadows shadows1 = Shadows();
  Shadows shadows2 = Shadows();
//
  generate() {
    setState(() {
      operation = oneBlock.operationGenerator();
      var1 = oneBlock.var1Generator();
      var2 = oneBlock.var2Generator();
      result = oneBlock.resultGenerator(var1, var2, operation);
      // choice = oneBlock.choiceGenerator();
      choice = 1;
      buttonSelected = oneBlock.ansButtonSelector();
      answer = oneBlock.answerGenerator(choice, var1, operation, var2, result);
      opt1 = oneBlock.opt1Generator(choice, answer, buttonSelected);
      opt2 = oneBlock.opt2Generator(choice, answer, buttonSelected, opt1);
      shadows1.set(null);
      shadows2.set(null);
      choiceAnswer = '';
      print(choice);
      print(answer);
    });
  }

  setAnswer() {
    setState(() {
      choiceAnswer = '$answer';
      print(choiceAnswer);
    });
  }

  answerChecker(opt, answer, Shadows shadow1, Shadows shadow2) {
    if (opt == answer) {
      setState(() {
        shadow1.set(Constants.greenShadow);
      });
      Future.delayed(Duration(milliseconds: 400), generate);
    } else {
      setState(() {
        shadow1.set(Constants.redShadow);
      });
      Future.delayed(Duration(milliseconds: 100), () {
        setState(() {
          shadow2.set(Constants.greenShadow);
        });
      });
    }
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
                      Text('  Score:')
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
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                choice == 0
                    ? ChoiceContainer(
                        choiceAnswer: choiceAnswer,
                      )
                    : Text(
                        '$var1',
                        style: Constants.textStyle2,
                      ),
                choice == 1
                    ? ChoiceContainer(
                        choiceAnswer: choiceAnswer,
                      )
                    : Text(operation, style: Constants.textStyle2),
                choice == 2
                    ? ChoiceContainer(
                        choiceAnswer: choiceAnswer,
                      )
                    : Text('$var2', style: Constants.textStyle2),
                Text('=', style: Constants.textStyle2),
                choice == 3
                    ? ChoiceContainer(
                        choiceAnswer: choiceAnswer,
                      )
                    : Text('$result', style: Constants.textStyle2)
              ],
            ),
          ),

          NeuContainer(
            height: 100,
            width: 200.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatNumButton(
                    text: '$opt1',
                    boxShadows: shadows1.get(),
                    onTap: () {
                      setAnswer();
                      answerChecker(opt1, answer, shadows1, shadows2);
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
                    answerChecker(opt2, answer, shadows2, shadows1);
                  },
                )
              ],
            ),
          ),
          Container(
            height: 100,
            alignment: Alignment.centerRight,
            child: NeuButtonWidget(
              child: Text('Next'),
              fillColor: Constants.BGColor,
              shadows: Constants.nextButtonShadow,
              margin: EdgeInsets.only(right: 20),
              onTap: () {},
            ),
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
