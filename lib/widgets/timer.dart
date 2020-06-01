import 'package:flutter/material.dart';
import 'dart:math';

import 'package:two_blocks/widgets/neu_container.dart';

import '../constants.dart';

class RoundPainter extends CustomPainter {
  Animation animation;
  double width;

  RoundPainter(this.animation, this.width);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5 * width;

    final w = size.width;

    Paint paint2 = Paint()
      ..color = Colors.blueGrey[200]
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1.5 * width;

    canvas.drawCircle(size.center(Offset.zero), w / 2, paint);
    canvas.drawArc(Offset.zero & size, 1.5 * pi,
        -(1 - animation.value) * 2 * pi, false, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}


class TimerWidget extends StatefulWidget {
  final AnimationController controller;
  final int time;

  const TimerWidget({Key key, this.controller, this.time}) : super(key: key);
  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: NeuContainer(
                        height: 60,
                        width: 60,
                        padding: EdgeInsets.all(2),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 1),
                              spreadRadius: 1,
                              blurRadius: 3,
                              color: Constants.DarkShadow),
                          BoxShadow(
                              offset: Offset(-1, -1),
                              spreadRadius: 1,
                              blurRadius: 3,
                              color: Colors.white),
                        ],
                        child: AnimatedBuilder(
                          animation: widget.controller,
                          builder: (context, child) {
                            return CustomPaint(
                              painter: RoundPainter(widget.controller, 3),
                              child: Align(
                                  alignment: FractionalOffset.center,
                                  child: Text(
                                    '${(widget.time - (widget.controller.duration.inSeconds * widget.controller.value)).toStringAsFixed(0)}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700]),
                                  )),
                            );
                          },
                        ),
                      ));
  }
}