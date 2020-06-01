import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';

class HighScoresScreen extends StatefulWidget {
  @override
  _HighScoresScreenState createState() => _HighScoresScreenState();
}

class _HighScoresScreenState extends State<HighScoresScreen> {
  @override
  Widget build(BuildContext context) {
    print('build::HighScoresScreen()');
    return Scaffold(
      backgroundColor: Constants.BGColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('High Scores'),
      ),
      body: Center(
        child: Text('HighScores will Appear here'),
      ),
    );
  }
}
