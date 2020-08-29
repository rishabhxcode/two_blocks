import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:two_blocks/questions/endurance.dart';
import 'package:two_blocks/screens/review.dart';

class RoundPainter extends CustomPainter {
  Animation animation;
  double b;

  RoundPainter(this.animation, this.b);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.orange.shade200
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5 * b;

    final w = size.width;

    Paint paint2 = Paint()
      ..color = Colors.deepOrange.shade700
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.5 * b;

    canvas.drawCircle(size.center(Offset.zero), w / 2, paint);
    canvas.drawArc(Offset.zero & size, 1.5 * pi,
        -(1 - animation.value) * 2 * pi, false, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class Endurance extends StatefulWidget {
  final int level;

  Endurance(this.level);

  @override
  _EnduranceState createState() => _EnduranceState(level);
}

class _EnduranceState extends State<Endurance> with TickerProviderStateMixin {
  final int level;
  _EnduranceState(this.level);
  EnduranceQuestions _enduranceQuestions;

  AnimationController controller;
  Color theme = Color(0xFF634CF3);
  Widget numButton(int num, double b, double w) {
    return Padding(
      padding: EdgeInsets.all(b),
      child: Container(
        height: 20 * b,
        width: w * b,
        child: OutlineButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.5 * b))),
          borderSide: BorderSide(
            color: theme,
            width: 0.4 * b,
          ),
          onPressed: () {
            setState(() {
              _enduranceQuestions.makeText(num);
              _enduranceQuestions.result(
                  _enduranceQuestions.select, resetController);
            });
          },
          child: Text('$num',
              style: TextStyle(
                fontSize: 7.5 * b,
                fontFamily: 'VarelaRound',
                color: theme,
              )),
        ),
      ),
    );
  }

  void resetController() {
    controller.reset();
    controller.forward();
  }

  Widget question(String root, String var1, String power, String symbol,
      String var2, double b) {
    return Text.rich(
      TextSpan(children: <InlineSpan>[
        TextSpan(
            text: root,
            style: TextStyle(
                fontFamily: 'VarelaRound',
                fontSize: 13 * b,
                color: Colors.black)),
        TextSpan(
            text: var1,
            style: TextStyle(
                fontFamily: 'VarelaRound',
                fontSize: 11 * b,
                color: Colors.black)),
        WidgetSpan(
            child: Container(
                height: 13 * b,
                child: Text(power,
                    style: TextStyle(
                        fontFamily: 'VarelaRound',
                        fontSize: 10 * b,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)))),
        WidgetSpan(
          child: Container(
            height: 9.5 * b,
            child: Text(symbol,
                style: TextStyle(
                    fontFamily: 'VarelaRound',
                    fontSize: 8 * b,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800)),
          ),
        ),
        TextSpan(
            text: var2,
            style: TextStyle(
                fontFamily: 'VarelaRound',
                fontSize: 11 * b,
                color: Colors.black)),
        WidgetSpan(
            child: Container(
                height: 9.5 * b,
                child: Text('=',
                    style: TextStyle(
                        fontFamily: 'VarelaRound',
                        fontSize: 8 * b,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800)))),
        TextSpan(
            text: (_enduranceQuestions.ansText.length == 0)
                ? _enduranceQuestions.def
                : _enduranceQuestions.ansText,
            style: TextStyle(
                fontFamily: 'VarelaRound',
                fontSize: 11 * b,
                color: _enduranceQuestions.ansColor)),
      ]),
    );
  }

  @override
  void initState() {
    super.initState();
    _enduranceQuestions = EnduranceQuestions(level);
    _enduranceQuestions.choose();
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: _enduranceQuestions.timer))
      ..addListener(() {
        setState(() {
          if (controller.duration.inSeconds * controller.value ==
              _enduranceQuestions.timer) {
            // Provider.of<PlayerScoreProvider>(context)
            //     .setScore(level, score);
            print("Score is : ${level} ${_enduranceQuestions.score}");
            //TODO: Send Score to Results Screen!!!
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Review(
                        answer: _enduranceQuestions.answer,
                        level: level,
                        score: _enduranceQuestions.score,
                      )),
            );
          }
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final bx = MediaQuery.of(context).size.width / 100;
    final by = MediaQuery.of(context).size.height / 100;
    _enduranceQuestions.timeleft = _enduranceQuestions.timer -
        (controller.duration.inSeconds * controller.value).toInt();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
            title: Text(
              'Endurance',
              style:
                  TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: <Widget>[
              Container(
                height: 44 * by,
                width: 100 * bx,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 100 * bx,
                      height: 10 * by,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 2 * bx, left: 2 * bx),
                                child: Text(
                                  ' Score: ${_enduranceQuestions.score}',
                                  style: TextStyle(),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: bx, left: 2 * bx),
                                child: Text(
                                  ' Solved: ${_enduranceQuestions.count}',
                                  style: TextStyle(),
                                ),
                              ),
                            ],
                          ),
                          FittedBox(
                            child: Container(
                                height: 20 * bx,
                                width: 20 * bx,
                                padding: EdgeInsets.all(2 * bx),
                                child: AnimatedBuilder(
                                  animation: controller,
                                  builder: (context, child) {
                                    return CustomPaint(
                                      painter: RoundPainter(controller, bx),
                                      child: Align(
                                          alignment: FractionalOffset.center,
                                          child: Text(
                                            '${(_enduranceQuestions.timer - (controller.duration.inSeconds * controller.value)).toStringAsFixed(0)}',
                                            style: TextStyle(
                                                fontSize: 6 * bx,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.purple),
                                          )),
                                    );
                                  },
                                )),
                          ),
                        ],
                      ),
                    ),
                    FittedBox(
                      child: Container(
                        alignment: Alignment.center,
                        height: 34 * by,
                        child: question(
                            _enduranceQuestions.root,
                            _enduranceQuestions.v1,
                            _enduranceQuestions.power,
                            _enduranceQuestions.symbol,
                            _enduranceQuestions.v2,
                            bx),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: FittedBox(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            numButton(1, bx, 26),
                            numButton(2, bx, 26),
                            numButton(3, bx, 26),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            numButton(4, bx, 26),
                            numButton(5, bx, 26),
                            numButton(6, bx, 26),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            numButton(7, bx, 26),
                            numButton(8, bx, 26),
                            numButton(9, bx, 26),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            numButton(0, bx, 40),
                            Padding(
                              padding: EdgeInsets.all(bx),
                              child: Container(
                                height: 20 * bx,
                                width: 40 * bx,
                                child: OutlineButton(
                                  onPressed: () {
                                    setState(() {
                                      _enduranceQuestions.ansText =
                                          _enduranceQuestions.ansText.substring(
                                              0,
                                              _enduranceQuestions
                                                      .ansText.length -
                                                  1);
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.5 * bx))),
                                  borderSide:
                                      BorderSide(width: 0.4 * bx, color: theme),
                                  child: Icon(
                                    Icons.backspace,
                                    size: 28,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
