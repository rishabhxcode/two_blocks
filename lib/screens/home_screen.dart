import 'package:flutter/material.dart';
import 'package:two_blocks/animations/routing_animation_widget.dart';
import 'package:two_blocks/constants.dart';
import 'package:two_blocks/main.dart';
import 'package:two_blocks/screens/highscores_screen.dart';
import 'package:two_blocks/screens/one_block_playground.dart';
import 'package:two_blocks/screens/two_block_playground.dart';
import 'package:two_blocks/widgets/neu_button_widget.dart';
import 'package:two_blocks/widgets/neu_container.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double h1 = 50;
  double w1 = 166;
  @override
  Widget build(BuildContext context) {
    print('build::HomeScreen()');
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          NeuContainer(
            height: 200,
            width: 200,
            fillColor: Constants.BGColor,
            borderRadius: BorderRadius.circular(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom:15),
                  width: 100,
                height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/two_blocks_launcher.png"))),
            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: Text(
                        'B',
                        style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        'L',
                        style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        'O',
                        style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink[400]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        'C',
                        style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        'K',
                        style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        'S',
                        style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber[900]),
                      ),
                    )
                  ],
                )
                // Text(
                //   'BLOCKS',
                //   style: TextStyle(fontSize: 32, letterSpacing: 3),
                // )
              ],
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.vertical,
            children: <Widget>[
              NeuButtonWidget(
                padding: EdgeInsets.all(4),
                height: 50,
                width: 166,
                border: Border.all(width: 2, color: Colors.yellow.shade800),
                highLightColor: Colors.white,
                splashColor: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 6),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.play_arrow,
                          size: 36,
                          color: Colors.purple,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '1 Block',
                          style: Constants.textStyle1,
                        ),
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(context, ScaleRoute(to: OneBlockPlayGround()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              NeuButtonWidget(
                border: Border.all(width: 2, color: Colors.pinkAccent.shade100),
                highLightColor: Colors.white,
                splashColor: Colors.transparent,
                padding: EdgeInsets.all(4),
                height: 50,
                width: 166,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 6),
                    Icon(
                      Icons.play_arrow,
                      size: 36,
                      color: Colors.red.shade700,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '2 Blocks',
                      style: Constants.textStyle1,
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context, ScaleRoute(to: TwoBlocksPlayGround()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              NeuButtonWidget(
                border: Border.all(width: 2, color: Colors.blue.shade300),
                highLightColor: Colors.white,
                splashColor: Colors.transparent,
                height: 50,
                width: 166,
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 14),
                    Icon(
                      Icons.insert_chart,
                      size: 32,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      'High scores',
                      style: Constants.textStyle1,
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(context,
                      PageSlideRoute(from: MyApp(), to: HighScoresScreen()));
                },
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
