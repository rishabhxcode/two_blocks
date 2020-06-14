import 'package:flutter/material.dart';
import 'package:two_blocks/animations/routing_animation_widget.dart';
import 'package:two_blocks/constants.dart';
import 'package:two_blocks/main.dart';
import 'package:two_blocks/screens/home_screen.dart';
import 'package:two_blocks/widgets/neu_button_widget.dart';

class GameOverScreen extends StatefulWidget {
  final int score;

  const GameOverScreen({Key key, this.score}) : super(key: key);
  @override
  _GameOverScreenState createState() => _GameOverScreenState();
}

class _GameOverScreenState extends State<GameOverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.BGColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(context, LtoRSlideRoute(to: MyApp()));
            }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Your Score', style: TextStyle(fontSize: 30)),
            Text(
              '${widget.score ?? 0}',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(),
            NeuButtonWidget(
              width: 200,
              height: 60,
              borderRadius: BorderRadius.all(Radius.circular(100)),
              boundaryRadius: BorderRadius.all(Radius.circular(100)),
              fillColor: Constants.BGColor,
              highLightColor: Colors.grey[100],
              splashColor: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow,
                    size: 40,
                    color: Colors.purple,
                  ),
                  Text(
                    'Play Again',
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.deepOrange[700],
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context, LtoRSlideRoute(to: MyApp()));
              },
            ),
            const SizedBox(),
            const SizedBox(),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}