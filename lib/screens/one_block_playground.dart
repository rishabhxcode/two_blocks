import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';
import 'package:two_blocks/questions/one_block_questions.dart';
import 'package:two_blocks/widgets/choice_container.dart';
import 'package:two_blocks/widgets/flat_num_button.dart';
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
//
  BorderColor borderColor0 = BorderColor();
  BorderColor borderColor1 = BorderColor();
  generate() {
    setState(() {
      operation = oneBlock.operationGenerator();
      var1 = oneBlock.var1Generator();
      var2 = oneBlock.var2Generator();
      result = oneBlock.resultGenerator(var1, var2, operation);
      choice = oneBlock.choiceGenerator();
      // choice = 1;
      buttonSelected = oneBlock.ansButtonSelector();
      answer = oneBlock.answerGenerator(choice, var1, operation, var2, result);
      opt1 = oneBlock.opt1Generator(choice, answer, buttonSelected);
      opt2 = oneBlock.opt2Generator(choice, answer, buttonSelected, opt1);
      //
      borderColor0.set(Colors.transparent);
      borderColor1.set(Colors.transparent);
    });
    print('operation: $operation');
    print('button: $buttonSelected');
    print('opt1: $opt1');
    print('opt2: $opt2');
  }

  answerChecker(opt, answer, BorderColor color) async {
    if (opt == answer) {
      setState(() {
        color.set(Colors.green);
        print('GREEN');
      });
      await Future.delayed(Duration(milliseconds: 200), generate);
    } else
      setState(() {
        color.set(Colors.red);
        print('RED');
      });
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
                    ? ChoiceContainer()
                    : Text(
                        '$var1',
                        style: Constants.textStyle2,
                      ),
                choice == 1
                    ? ChoiceContainer()
                    : Text(operation, style: Constants.textStyle2),
                choice == 2
                    ? ChoiceContainer()
                    : Text('$var2', style: Constants.textStyle2),
                Text('=', style: Constants.textStyle2),
                choice == 3
                    ? ChoiceContainer()
                    : Text('$result', style: Constants.textStyle2)
              ],
            ),
          ),

          NeuContainer(
            width: 200,
            height: 100,
            child: Row(
              children: [
                FlatNumButton(
                    text: '$opt1',
                    borderColor: borderColor0.get(),
                    onTap: () {
                      answerChecker(opt1, answer, borderColor0);
                    }),
                FlatNumButton(
                  text: '$opt2',
                  borderColor: borderColor1.get(),
                  onTap: () {
                    answerChecker(opt2, answer, borderColor1);
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}

class BorderColor {
  Color _border;
  void set(Color color) => _border = color;
  Color get() => _border;
}
