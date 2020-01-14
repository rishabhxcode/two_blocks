import 'package:flutter/material.dart';
import 'package:two_blocks/all.dart';

class PlayGround extends StatefulWidget {
  @override
  _PlayGroundState createState() => _PlayGroundState();
}

class _PlayGroundState extends State<PlayGround> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            alignment: Alignment.center,
            child: Text('6\u00D77=42', style: TextStyle(fontSize: 60),),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: CustomButtonPurple(
                                text: '+',
                              ),
                            ),
                            Expanded(
                              child: CustomButtonPurple(
                                text: '-',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: CustomButtonPurple(
                                text: '\u00D7',
                              ),
                            ),
                            Expanded(
                              child: CustomButtonPurple(
                                text: '\u00F7',
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: CustomButtonYellow(
                                text: '+',
                              ),
                            ),
                            Expanded(
                              child: CustomButtonYellow(
                                text: '-',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: CustomButtonYellow(
                                text: '\u00D7',
                              ),
                            ),
                            Expanded(
                              child: CustomButtonYellow(
                                text: '\u00F7',
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
