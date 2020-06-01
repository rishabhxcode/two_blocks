import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';

class TwoBlocksPlayGround extends StatefulWidget {
  @override
  _TwoBlocksPlayGroundState createState() => _TwoBlocksPlayGroundState();
}

class _TwoBlocksPlayGroundState extends State<TwoBlocksPlayGround> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.BGColor,
      appBar: AppBar(
        elevation: 0.0,
      ),
    );
  }
}
