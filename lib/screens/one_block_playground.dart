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
  int time = 10;
  int highScore;
  int timeLeft;
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

  setTimer() {
    timerController =
        AnimationController(vsync: this, duration: Duration(seconds: time))
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
    if (ob.level == 1) {
      time = 13;
      setTimer();
    } else if (ob.level == 2) {
      time = 16;
      setTimer();
    } else {
      time = 10;
      setTimer();
    }
  }

  @override
  void initState() {
    ob.generate();
    getScore();
    setTimer();
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
                              child:const Divider(
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
                      time = 13;
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
