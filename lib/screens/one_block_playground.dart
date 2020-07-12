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
import 'package:two_blocks/widgets/two_block_logo.dart';

class OneBlockPlayGround extends StatefulWidget {
  @override
  _OneBlockPlayGroundState createState() => _OneBlockPlayGroundState();
}

class _OneBlockPlayGroundState extends State<OneBlockPlayGround>
    with TickerProviderStateMixin {
  OneBlockQuestions ob = OneBlockQuestions();
  SaveAndGet sharedPref = SaveAndGet();
  AnimationController timerController;
  int time = 7;
  int highScore;
  getScore() async {
    highScore = await sharedPref.getOneBlockScore() ?? 0;
    setState(() {});
    print(highScore);
  }

  saveScore(score) async {
    if (score >= highScore) {
      sharedPref.saveOneBlockScore(score);
      highScore = score;
    }
  }

  setTimer(int seconds) {
    timerController =
        AnimationController(vsync: this, duration: Duration(seconds: seconds))
          ..addListener(() {
            ob.onTimeFinished(
                timerController.duration.inSeconds * timerController.value,
                time, route: () {
              Future.delayed(Duration(milliseconds: 1500), () {
                Navigator.pushReplacement(
                    context,
                    RtoLSlideRoute(
                        to: GameOverScreen(
                      score: ob.score,
                    )));
              });
            });
            setState(() {});
          });
  }

  changeLevel() {
    if (ob.level == 0) {
      time = 7;
      setTimer(time);
    } else if (ob.level == 1) {
      time = 8;
      setTimer(time);
    } else if (ob.level == 2) {
      time = 9;
      setTimer(time);
    } else if (ob.level == 3) {
      time = 10;
      setTimer(time);
    } else if (ob.level == 4) {
      time = 11;
      setTimer(time);
    } else if (ob.level == 5) {
      time = 12;
      setTimer(time);
    } else if (ob.level == 6) {
      time = 13;
      setTimer(time);
    } else if (ob.level == 7) {
      time = 15;
      setTimer(time);
    } else if (ob.level == 8) {
      time = 16;
      setTimer(time);
    } else if (ob.level == 9) {
      time = 18;
      setTimer(time);
    } else if (ob.level == 10) {
      time = 20;
      setTimer(time);
    } else {
      time = 24;
      setTimer(time);
    }
  }

  @override
  void initState() {
    getScore();
    setTimer(time);
    ob.generate();
    timerController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build::OneBlockPlayGround()');
    print('COUNT: ${ob.count}');
    print('LEVEL: ${ob.level}');
    print('TIME: $time');
    print('VAR-1: ${ob.var1}');
    print('VAR-2: ${ob.var2}');
    return Scaffold(
      backgroundColor: Constants.BGColor,
      appBar: AppBar(
        backgroundColor: Constants.BGColor,
        title: Text('Playground'),
        elevation: 0,
        leading: Container(
            padding: EdgeInsets.all(8),
            child: FittedBox(
              child: LOGO(),
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 10),
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
                var1: ob.var1,
                var2: ob.var2,
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
                                  ob.onPressed1(
                                      controller: timerController,
                                      route: () {
                                        Navigator.pushReplacement(
                                            context,
                                            RtoLSlideRoute(
                                                to: GameOverScreen(
                                              score: ob.score,
                                            )));
                                      },
                                      generate: () {
                                        Future.delayed(
                                            Duration(milliseconds: 400), () {
                                          changeLevel();
                                          timerController.reset();
                                          ob.generate();
                                          saveScore(ob.score);
                                          timerController.forward();
                                          setState(() {});
                                        });
                                      },
                                      time: time);
                                  setState(() {});
                                }),
                            Container(
                              height: 80,
                              child: const VerticalDivider(
                                color: Colors.grey,
                                thickness: 0.3,
                                width: 0.5,
                              ),
                            ),
                            FlatNumButton(
                              text: '${ob.opt2}',
                              boxShadows: ob.shadows2.get(),
                              onTap: () {
                                ob.onPressed2(
                                    controller: timerController,
                                    route: () {
                                      Navigator.pushReplacement(
                                          context,
                                          RtoLSlideRoute(
                                              to: GameOverScreen(
                                            score: ob.score,
                                          )));
                                    },
                                    generate: () {
                                      Future.delayed(
                                          Duration(milliseconds: 400), () {
                                        changeLevel();
                                        timerController.reset();
                                        ob.generate();
                                        saveScore(ob.score);
                                        timerController.forward();

                                        setState(() {});
                                      });
                                    },
                                    time: time);

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
                              child: const Divider(
                                thickness: 0.5,
                                height: 0.5,
                              ),
                            ),
                            Container(
                              width: 80,
                              child: const Divider(
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
                                  ob.onPressed3(
                                      controller: timerController,
                                      route: () {
                                        Navigator.pushReplacement(
                                            context,
                                            RtoLSlideRoute(
                                                to: GameOverScreen(
                                              score: ob.score,
                                            )));
                                      },
                                      generate: () {
                                        Future.delayed(
                                            Duration(milliseconds: 400), () {
                                          changeLevel();
                                          timerController.reset();
                                          ob.generate();
                                          saveScore(ob.score);
                                          timerController.forward();
                                          setState(() {});
                                        });
                                      },
                                      time: time);
                                  setState(() {});
                                }),
                            Container(
                              height: 80,
                              child: const VerticalDivider(
                                color: Colors.grey,
                                thickness: 0.3,
                                width: 0.5,
                              ),
                            ),
                            FlatNumButton(
                              text: '${ob.opt4}',
                              boxShadows: ob.shadows4.get(),
                              onTap: () {
                                ob.onPressed4(
                                    controller: timerController,
                                    route: () {
                                      Navigator.pushReplacement(
                                          context,
                                          RtoLSlideRoute(
                                              to: GameOverScreen(
                                            score: ob.score,
                                          )));
                                    },
                                    generate: () {
                                      Future.delayed(
                                          Duration(milliseconds: 400), () {
                                        changeLevel();
                                        timerController.reset();
                                        ob.generate();
                                        saveScore(ob.score);
                                        timerController.forward();

                                        setState(() {});
                                      });
                                    },
                                    time: time);
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
