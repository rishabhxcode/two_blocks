import 'package:flutter/material.dart';
import 'package:two_blocks/animations/routing_animation_widget.dart';
import 'package:two_blocks/constants.dart';
import 'package:two_blocks/logic/save_and_get.dart';
import 'package:two_blocks/questions/one_block_questions.dart';
import 'package:two_blocks/screens/game_over_screen.dart';
import 'package:two_blocks/widgets/animated_message.dart';
import 'package:two_blocks/widgets/equation_widget.dart';
import 'package:two_blocks/widgets/flat_num_button.dart';
import 'package:two_blocks/widgets/neu_container.dart';
import 'package:two_blocks/widgets/next_button.dart';
import 'package:two_blocks/widgets/playground_indigator.dart';

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
                time) {
              if (ob.lives > 0) ob.checkLivesOnTimeOver();
              ob.setAbsorbToTrue();
              ob.setIsIncorrentToTrue();
              ob.setTimeUpMessage();
              if (ob.answer == ob.opt1) ob.shadows1.set(Constants.greenShadow);
              if (ob.answer == ob.opt2) ob.shadows2.set(Constants.greenShadow);
              if (ob.answer == ob.opt3) ob.shadows3.set(Constants.greenShadow);
              if (ob.answer == ob.opt4) ob.shadows4.set(Constants.greenShadow);
              setState(() {});
              if (ob.lives <= 0) {
                ob.setGameOverMessage();
                Future.delayed(Duration(milliseconds: 1500), () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      RtoLSlideRoute(
                          to: GameOverScreen(
                        score: ob.score,
                      )));
                });
              }
            }
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
          PlayGroundIndigator(
            highScore: highScore,
            lives: ob.lives,
            score: ob.score,
            time: time,
            timerController: timerController,
          ),
          /////////////////////////////////
          Expanded(
            flex: 2,
            child: AnimatedMessage(
              message: ob.message,
              messageColor: ob.messageColor.get(),
              messageSize: ob.messageSize,
            ),
          ),
          Expanded(
            flex: 3,
            child: EquationWidget(
                opt1: ob.var1,
                opt2: ob.var2,
                choiceAnswer: ob.choiceAnswer,
                result: ob.result,
                choiceSelected: ob.choiceSelected,
                operation: ob.operation),
          ),

          Expanded(
            flex: 6,
            child: Container(
              alignment: Alignment.center,
              // color: Colors.cyan,
              child: FittedBox(
                fit: BoxFit.scaleDown,
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
                                      ob.opt1, ob.answer, ob.shadows1,
                                      () async {
                                    await Future.delayed(
                                        const Duration(milliseconds: 300), () {
                                      ob.generate();
                                      saveScore(ob.score);
                                      setState(() {});
                                    });
                                  }, routeToGameOverScreen: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        RtoLSlideRoute(
                                            to: GameOverScreen(
                                          score: ob.score,
                                        )));
                                  }, controller: timerController);
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
                                ob.answerChecker(
                                    ob.opt2, ob.answer, ob.shadows2, () async {
                                  await Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    ob.generate();
                                    saveScore(ob.score);
                                    setState(() {});
                                  });
                                }, routeToGameOverScreen: () {
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                      context,
                                      RtoLSlideRoute(
                                          to: GameOverScreen(
                                        score: ob.score,
                                      )));
                                }, controller: timerController);
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
                                      ob.opt3, ob.answer, ob.shadows3,
                                      () async {
                                    await Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      ob.generate();
                                      saveScore(ob.score);
                                      setState(() {});
                                    });
                                  }, routeToGameOverScreen: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                        context,
                                        RtoLSlideRoute(
                                            to: GameOverScreen(
                                          score: ob.score,
                                        )));
                                  }, controller: timerController);
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
                                ob.answerChecker(
                                    ob.opt4, ob.answer, ob.shadows4, () async {
                                  await Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    ob.generate();

                                    saveScore(ob.score);
                                    setState(() {});
                                  });
                                }, routeToGameOverScreen: () {
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                      context,
                                      RtoLSlideRoute(
                                          to: GameOverScreen(score: ob.score)));
                                }, controller: timerController);
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
          ),
          Container(
            height: 100,
            alignment: Alignment.centerRight,
            child: ob.isInCorrect
                ? NextButton(
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
