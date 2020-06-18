import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';
import 'package:two_blocks/questions/one_block_questions.dart';
import 'package:two_blocks/questions/two_block_questions.dart';
import 'package:two_blocks/widgets/animated_message.dart';
import 'package:two_blocks/widgets/flat_num_button.dart';
import 'package:two_blocks/widgets/neu_container.dart';
import 'package:two_blocks/widgets/next_button.dart';
import 'package:two_blocks/widgets/two_block_choice_containers.dart';

class TwoBlocksPlayGround extends StatefulWidget {
  @override
  _TwoBlocksPlayGroundState createState() => _TwoBlocksPlayGroundState();
}

class _TwoBlocksPlayGroundState extends State<TwoBlocksPlayGround> {
  OneBlockQuestions ob = OneBlockQuestions();
  TwoBlockQuestions tb = TwoBlockQuestions();
  AnimationController timerController;
  int time;
  @override
  void initState() {
    tb.generate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.BGColor,
      appBar: AppBar(
        backgroundColor: Constants.BGColor,
        title: Text('Playground'),
        elevation: 0,
        leading: Center(
            child: Text(
          'logo',
          style: TextStyle(fontSize: 10),
        )),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            color: Colors.yellow,
            height: 70,
          ),
          // PlayGroundIndigator()
          Expanded(
            child: AnimatedMessage(
              message: 'Hello',
              messageColor: Colors.green,
              messageSize: 30,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                tb.choice1 == 0
                    ? Choice1Container()
                    : Text(
                        '${tb.var1}',
                        style: Constants.textStyle2,
                      ),
                tb.choice1 == 1
                    ? Choice1Container()
                    : tb.choice2 == 1
                        ? Choice2Container()
                        : Text(
                            '${tb.operation}',
                            style: Constants.textStyle2,
                          ),
                tb.choice1 == 2
                    ? Choice1Container()
                    : tb.choice2 == 2
                        ? Choice2Container()
                        : Text(
                            '${tb.var2}',
                            style: Constants.textStyle2,
                          ),
                Text(
                  '=',
                  style: Constants.textStyle2,
                ),
                tb.choice2 == 3
                    ? Choice2Container()
                    : Text(
                        '${tb.result}',
                        style: Constants.textStyle2,
                      )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 12,
                ),
                // A //
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AbsorbPointer(
                        absorbing: tb.isAabsorbed,
                        child: NeuContainer(
                          height: 200.5,
                          width: 200.5,
                          fillColor: Color(0xfff4edf5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlatNumButton(
                                    text: '${tb.optA1}',
                                    color: tb.colorA1.get(),
                                    onTap: () {
                                      tb.onPressedA1();
                                      setState(() {});
                                    },
                                  ),
                                  Container(
                                    height: 80,
                                    child: VerticalDivider(
                                      color: Colors.purple[200],
                                      thickness: 0.5,
                                      width: 0.5,
                                    ),
                                  ),
                                  FlatNumButton(
                                    text: '${tb.optA2}',
                                    color: tb.colorA2.get(),
                                    onTap: () {
                                      tb.onPressedA2();
                                      setState(() {});
                                    },
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 80,
                                    child: Divider(
                                      thickness: 0.5,
                                      height: 0.5,
                                      color: Colors.purple[200],
                                    ),
                                  ),
                                  Container(
                                    width: 80,
                                    child: Divider(
                                      thickness: 0.5,
                                      height: 0.5,
                                      color: Colors.purple[200],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlatNumButton(
                                    text: '${tb.optA3}',
                                    color: tb.colorA3.get(),
                                    onTap: () {
                                      tb.onPressedA3();
                                      setState(() {});
                                    },
                                  ),
                                  Container(
                                    height: 80,
                                    child: VerticalDivider(
                                      color: Colors.purple[200],
                                      thickness: 0.5,
                                      width: 0.5,
                                    ),
                                  ),
                                  FlatNumButton(
                                    text: '${tb.optA4}',
                                    color: tb.colorA4.get(),
                                    onTap: () {
                                      tb.onPressedA4();
                                      setState(() {});
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
                // B //
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AbsorbPointer(
                      absorbing: tb.isBabsorbed,
                      child: NeuContainer(
                        height: 200.5,
                        width: 200.5,
                        fillColor: Color(0xffedf4f5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlatNumButton(
                                  text: '${tb.optB1}',
                                  color: tb.colorB1.get(),
                                  onTap: () {
                                    tb.onPressedB1();
                                    setState(() {});
                                  },
                                ),
                                Container(
                                  height: 80,
                                  child: VerticalDivider(
                                    color: Colors.blue[300],
                                    thickness: 0.5,
                                    width: 0.5,
                                  ),
                                ),
                                FlatNumButton(
                                  text: '${tb.optB2}',
                                  color: tb.colorB2.get(),
                                  onTap: () {
                                    tb.onPressedB2();
                                    setState(() {});
                                  },
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 80,
                                  child: Divider(
                                    thickness: 0.5,
                                    height: 0.5,
                                    color: Colors.blue[300],
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  child: Divider(
                                    thickness: 0.5,
                                    height: 0.5,
                                    color: Colors.blue[300],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlatNumButton(
                                  text: '${tb.optB3}',
                                  color: tb.colorB3.get(),
                                  onTap: () {
                                    tb.onPressedB3();
                                    setState(() {});
                                  },
                                ),
                                Container(
                                  height: 80,
                                  child: VerticalDivider(
                                    color: Colors.blue[300],
                                    thickness: 0.5,
                                    width: 0.5,
                                  ),
                                ),
                                FlatNumButton(
                                  text: '${tb.optB4}',
                                  color: tb.colorB4.get(),
                                  onTap: () {
                                    tb.onPressedB4();
                                    setState(() {});
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                )
              ],
            ),
          ),
          Container(
            height: 100,
            alignment: Alignment.centerRight,
            child: NextButton(
              onTap: () {
                tb.generate();
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }
}
