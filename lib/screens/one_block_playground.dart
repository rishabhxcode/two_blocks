import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';
import 'package:two_blocks/widgets/flat_num_button.dart';
import 'package:two_blocks/widgets/neu_container.dart';

class OneBlockPlayGround extends StatefulWidget {
  @override
  _OneBlockPlayGroundState createState() => _OneBlockPlayGroundState();
}

class _OneBlockPlayGroundState extends State<OneBlockPlayGround> {
  int var1 = 0;
  int var2 = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build::OneBlockPlayGround()');
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 50,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '  High score:',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text('  Score:')
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  child: Wrap(
                    children: <Widget>[
                      Icon(Icons.favorite),
                      Icon(Icons.favorite),
                      Icon(Icons.favorite)
                    ],
                  ),
                )),
                Expanded(
                  child: Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: Text('Timer'),
                  ),
                ),
              ],
            ),
          ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$var1',
                  style: Constants.textStyle1,
                ),
                Text(Constants.divide, style: Constants.textStyle1),
                Text('$var2', style: Constants.textStyle1),
                Text('=', style: Constants.textStyle1),
                Text('56', style: Constants.textStyle1)
              ],
            ),
          ),
          NeuContainer(
            height: 200,
            width: 200,
            margin: EdgeInsets.only(bottom: 100),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    FlatNumButton(
                      topLeftBorder: 4,
                    ),
                    FlatNumButton(
                      topRightBorder: 4,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    FlatNumButton(
                      bottomLeftBorder: 4,
                    ),
                    FlatNumButton(
                      bottomRightBorder: 4,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
