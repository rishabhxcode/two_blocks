import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color white = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: FittedBox(
            child: Container(
              height: 50,
              width: 200,
              child: FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.play_arrow,
                      color: white,
                      size: 30,
                    ),
                    FittedBox(
                      child: Text('1 Block',
                          style: TextStyle(color: white, fontSize: 18)),
                    ),
                  ],
                ),
                color: Colors.pinkAccent.shade700,
                onPressed: () {},
              ),
            ),
          ),
        ),
        SizedBox(
          height: 18,
        ),
        FittedBox(
          child: Container(
            height: 50,
            width: 200,
            child: FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.play_arrow,
                    color: white,
                    size: 30,
                  ),
                  Text('2 Blocks',
                      style: TextStyle(color: white, fontSize: 18)),
                ],
              ),
              color: Colors.deepPurpleAccent.shade700,
              onPressed: () {},
            ),
          ),
        ),
        SizedBox(
          height: 18,
        ),
        FittedBox(
          child: Container(
            height: 50,
            width: 200,
            child: FlatButton(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.insert_chart,
                    color: white,
                    size: 20,
                  ),
                  FittedBox(
                    child: Text('High Scores',
                        style: TextStyle(color: white, fontSize: 18)),
                  ),
                ],
              ),
              color: Colors.deepOrange.shade900,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
