import 'package:flutter/material.dart';
import 'package:two_blocks/widgets/timer.dart';

class PlayGroundIndigator extends StatelessWidget {
  final int highScore;
  final int score;
  final int lives;
  final AnimationController timerController;
  final int time;

  const PlayGroundIndigator({
    Key? key,
    required this.highScore,
    required this.score,
    required this.lives,
    required this.timerController,
    required this.time,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text('  Score: $score')
              ],
            ),
          ),
          Expanded(
              child: Container(
            alignment: Alignment.topCenter,
            child: Wrap(
              children: <Widget>[
                Icon(
                  lives > 0 ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red[400],
                ),
                Icon(
                  lives > 1 ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red[400],
                ),
                Icon(
                  lives == 3 ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red[400],
                )
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
    );
  }
}
