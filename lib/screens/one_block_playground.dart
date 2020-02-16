import 'package:flutter/material.dart';
import 'package:two_blocks/widgets/neo_button.dart';
import 'package:two_blocks/widgets/neo_container.dart';

class OneBlockPlayGround extends StatefulWidget {
  @override
  _OneBlockPlayGroundState createState() => _OneBlockPlayGroundState();
}

class _OneBlockPlayGroundState extends State<OneBlockPlayGround> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playground'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.cyan.shade100,
            height: 50,
            child: Row(
              children: <Widget>[],
            ),
          ),
          NeoContainer()
        ],
      ),
    );
  }
}
