import 'package:flutter/material.dart';

class Review extends StatefulWidget {
  final int score, level, answer;

  Review({@required this.answer, @required this.score, @required this.level});

  @override
  _ReviewState createState() =>
      _ReviewState(answer: answer, level: level, score: score);
}

class _ReviewState extends State<Review> {
  final int score, level, answer;
  int bestScore;
  Color answerBackColor = Color(0xFF00ADB5);
  Color bestScoreColor = Color(0xFF9365DB);
  Color theme = Color(0xFF634CF3);
  Color tutorial = Color(0xFFFDAC61);
  Color currentScoreColor = Color(0xFFF67280);
  int tapped = 0;

  _ReviewState(
      {@required this.answer, @required this.level, @required this.score});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bestScore = Provider.of<PlayerScoreProvider>(context).getBestScore(level);
    bestScore = 50;
    final by = MediaQuery.of(context).size.height / 100;
    final bx = MediaQuery.of(context).size.width / 100;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: by * 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FittedBox(
                child: Container(
                  alignment: Alignment.center,
                  width: bx * 100,
                  height: bx * 20,
                  color: answerBackColor,
                  child: Text(
                    "Answer is: $answer",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: bx * 10,
                        fontFamily: "VarelaRound"),
                  ),
                ),
              ),
              FittedBox(
                child: Container(
                  padding: EdgeInsets.only(top: bx * 10, bottom: bx * 5),
                  child: Text(
                    "Level $level",
                    style: TextStyle(
                      fontFamily: "VarelaRound",
                      fontSize: 6 * bx,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FittedBox(
                        child: Container(
                          padding: EdgeInsets.only(bottom: bx * 5),
                          child: Text(
                            "Current Score:",
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontSize: 5 * bx,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Container(
                          padding: EdgeInsets.only(bottom: bx * 5),
                          child: Text(
                            "$score",
                            style: TextStyle(
                              fontFamily: "VarelaRound",
                              fontSize: 12 * bx,
                              color: currentScoreColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FittedBox(
                        child: Container(
                          padding: EdgeInsets.only(bottom: bx * 5),
                          child: Text(
                            "Best Score:",
                            style: TextStyle(
                                fontFamily: "Raleway",
                                fontSize: 5 * bx,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Container(
                          padding: EdgeInsets.only(bottom: bx * 5),
                          child: Text(
                            "$bestScore",
                            style: TextStyle(
                              fontFamily: "VarelaRound",
                              fontSize: 12 * bx,
                              color: bestScoreColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: 20 * bx,
                      width: tapped == 0 ? 84 * bx : 95 * bx,
                      child: RaisedButton(
                        color: tutorial,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FittedBox(
                              child: Text(
                                'Show tutorial',
                                style: TextStyle(
                                    fontSize: 5 * bx,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Raleway',
                                    color: Colors.white),
                              ),
                            ),
                            Icon(
                              tapped == 0
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.white,
                              size: 8 * bx,
                            ),
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            if (tapped == 0) {
                              tapped = 1;
                            } else {
                              tapped = 0;
                            }
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: tapped == 0
                                ? BorderRadius.all(Radius.circular(5 * bx))
                                : BorderRadius.only(
                                    topLeft: Radius.circular(5 * bx),
                                    topRight: Radius.circular(5 * bx))),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      alignment: Alignment.center,
                      height: tapped == 0 ? 0 : 400,
                      width: tapped == 0 ? 84 * bx : 95 * bx,
                      decoration: BoxDecoration(
                        border: Border.all(color: tutorial, width: 2),
                        // color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5 * bx),
                            bottomRight: Radius.circular(5 * bx)),
                      ),
                      child: Text("I am tutorial "),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 4 * bx, bottom: 6 * bx),
                  height: 20 * bx,
                  width: 84 * bx,
                  child: RaisedButton(
                    color: theme,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FittedBox(
                          child: Text(
                            'Play Again',
                            style: TextStyle(
                                fontSize: 5 * bx,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Raleway',
                                color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.replay,
                          color: Colors.white,
                          size: 8 * bx,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return Difficulty(bx);
                      //     });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(5 * bx))),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
