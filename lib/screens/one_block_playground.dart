import 'package:flutter/material.dart';
import 'package:two_blocks/widgets/neu_button.dart';
import 'package:two_blocks/widgets/num_button.dart';

class OneBlockPlayGround extends StatefulWidget {
  @override
  _OneBlockPlayGroundState createState() => _OneBlockPlayGroundState();
}

class _OneBlockPlayGroundState extends State<OneBlockPlayGround> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Playground'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            color: Colors.cyan.shade100,
            height: 50,
            child: Row(
              children: <Widget>[],
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NumButton(
                    height: 100,
                  ),
                  NumButton(
                    height: 100,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NumButton(
                    height: 100,
                  ),
                  NumButton(
                    height: 100,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
