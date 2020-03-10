import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';

class HighScoresScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build::HighScoresScreen()');
    return Scaffold(
      backgroundColor: Constants.BGColor,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Text('HighScores will Appear here'),
      ),
    );
  }
}
