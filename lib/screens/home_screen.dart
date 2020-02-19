import 'package:flutter/material.dart';
import 'package:two_blocks/widgets/neu_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color white = Colors.white;
  double h1 = 50;
  double w1 = 166;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 100),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(20)),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.vertical,
            children: <Widget>[
              NeuButton(
                padding: EdgeInsets.all(4),
                height: 50,
                width: 166,
                border: Border.all(width: 2, color: Colors.yellow.shade800),
                highLightColor: Colors.white,
                splashColor: Colors.amber,
                borderRadius: BorderRadius.circular(4),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 6),
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
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              NeuButton(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 2, color: Colors.pinkAccent.shade100),
                highLightColor: Colors.white,
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
                      '2 Block',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              NeuButton2(
                border: Border.all(width: 2, color: Colors.blue.shade300),
                highLightColor: Colors.white,
                splashColor: Colors.transparent,
                height: h1,
                width: w1,
                onTap: (){
                  setState(() {
                    w1=166;
                    h1 = 50;
                  });
                },
                onTapDown: (tapDownDetails) {
                  setState(() {
                    h1 = 46;
                    w1 = 160;
                  });
                },
                onTapCancel: (){
                  setState(() {
                    w1 = 166;
                    h1 = 50;
                  });
                },
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
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
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
