import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';
import 'package:two_blocks/logic/save_and_get.dart';
import 'package:two_blocks/questions/one_block_questions.dart';
import 'package:two_blocks/widgets/choice_container.dart';
import 'package:two_blocks/widgets/flat_num_button.dart';
import 'package:two_blocks/widgets/neu_button_widget.dart';
import 'package:two_blocks/widgets/neu_container.dart';
import 'package:two_blocks/widgets/timer.dart';

class OneBlockPlayGround extends StatefulWidget {
  @override
  _OneBlockPlayGroundState createState() => _OneBlockPlayGroundState();
}

class _OneBlockPlayGroundState extends State<OneBlockPlayGround>
    with TickerProviderStateMixin {
  OneBlockQuestions ob = OneBlockQuestions();
  SaveAndGet sharedPref = SaveAndGet();
  AnimationController timerController;
  int time;
  int highScore;
  getScore() async {
    highScore = await sharedPref.getOneBlockScore() ?? 0;
    setState(() {});
    print(highScore);
  }

  saveScore(score) async {
    if (score > highScore) {
      sharedPref.saveOneBlockScore(score);
      highScore++;
    }
  }

  @override
  void initState() {
    ob.generate();
    getScore();
    time = 10;
    timerController =
        AnimationController(vsync: this, duration: Duration(seconds: time))
          ..addListener(() {
            if (timerController.duration.inSeconds * timerController.value ==
                time) {}
          });
    timerController.forward();
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
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '  High score: $highScore',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text('  Score: ${ob.score}')
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.topCenter,
                  child: Wrap(
                    children: <Widget>[
                      Icon(Icons.favorite),
                      Icon(Icons.favorite),
                      Icon(Icons.favorite)
                    ],
                  ),
                )),
                Expanded(
                    child: TimerWidget(
                  controller: timerController,
                  time: time,
                )),
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
                  ob.choiceSelected == 0
                      ? ChoiceContainer(
                          choiceAnswer: ob.choiceAnswer,
                        )
                      : Text(
                          '${ob.var1}',
                          style: Constants.textStyle2,
                        ),
                  ob.choiceSelected == 1
                      ? ChoiceContainer(
                          choiceAnswer: ob.choiceAnswer,
                        )
                      : Text(ob.operation, style: Constants.textStyle2),
                  ob.choiceSelected == 2
                      ? ChoiceContainer(
                          choiceAnswer: ob.choiceAnswer,
                        )
                      : Text('${ob.var2}', style: Constants.textStyle2),
                  Text('=', style: Constants.textStyle2),
                  ob.choiceSelected == 3
                      ? ChoiceContainer(
                          choiceAnswer: ob.choiceAnswer,
                        )
                      : Text('${ob.result}', style: Constants.textStyle2)
                ],
              ),
            ),
          ),

          Expanded(
            child: Container(
              alignment: Alignment.center,
              // color: Colors.cyan,
              child: AbsorbPointer(
                absorbing: ob?.absorbOptButtons ?? false,
                child: NeuContainer(
                  height: 200.5,
                  width: 200.5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatNumButton(
                              text: '${ob.opt1}',
                              boxShadows: ob.shadows1.get(),
                              onTap: () {
                                ob.setAnswer();
                                ob.answerChecker(
                                  ob.opt1,
                                  ob.answer,
                                  ob.shadows1,
                                  () async {
                                    await Future.delayed(
                                        const Duration(milliseconds: 300), () {
                                      ob.generate();
                                      timerController.reset();
                                      timerController.forward();
                                      saveScore(ob.score);
                                      setState(() {});
                                    });
                                  },
                                );
                                setState(() {});
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
                            text: '${ob.opt2}',
                            boxShadows: ob.shadows2.get(),
                            onTap: () {
                              ob.setAnswer();
                              ob.answerChecker(ob.opt2, ob.answer, ob.shadows2,
                                  () async {
                                await Future.delayed(
                                    const Duration(milliseconds: 500), () {
                                  ob.generate();
                                  timerController.reset();
                                  timerController.forward();
                                  saveScore(ob.score);
                                  setState(() {});
                                });
                              });
                              setState(() {});
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
                              text: '${ob.opt3}',
                              boxShadows: ob.shadows3.get(),
                              onTap: () {
                                ob.setAnswer();

                                ob.answerChecker(
                                    ob.opt3, ob.answer, ob.shadows3, () async {
                                  await Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    ob.generate();
                                    timerController.reset();
                                    timerController.forward();
                                    saveScore(ob.score);
                                    setState(() {});
                                  });
                                });
                                setState(() {});
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
                            text: '${ob.opt4}',
                            boxShadows: ob.shadows4.get(),
                            onTap: () {
                              ob.setAnswer();
                              ob.answerChecker(ob.opt4, ob.answer, ob.shadows4,
                                  () async {
                                await Future.delayed(
                                    const Duration(milliseconds: 500), () {
                                  ob.generate();
                                  timerController.reset();
                                  timerController.forward();
                                  saveScore(ob.score);
                                  setState(() {});
                                });
                              });
                              setState(() {});
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
            child: ob.isInCorrect
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
                      ob.generate();
                      ob.setIsInCorrect(false);
                      saveScore(ob.score);
                      timerController.reset();
                      timerController.forward();
                      setState(() {});
                    },
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}
