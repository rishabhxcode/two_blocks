import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';
import 'package:two_blocks/widgets/neu_button_widget.dart';

class GameOverScreen extends StatefulWidget {
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Your Score', style: TextStyle(fontSize: 30)),
            Text(
              '10',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(),
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
              onTap: () {},
            ),
            SizedBox(),
            SizedBox(),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
