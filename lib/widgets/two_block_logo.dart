import 'package:flutter/material.dart';

class LOGO extends StatelessWidget {
  final double sizeOf2;
  final double wordSize;
  final FontWeight fontWeightOf2;
  final FontWeight fontWeightWord;
  const LOGO(
      {Key key,
      this.sizeOf2,
      this.wordSize,
      this.fontWeightOf2,
      this.fontWeightWord})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '2',
          style: TextStyle(
              fontSize: sizeOf2 ?? 100,
              color: Colors.purple[700],
              fontWeight: fontWeightOf2 ?? FontWeight.w600),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(1),
              child: Text(
                'B',
                style: TextStyle(
                    fontSize: wordSize ?? 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                'L',
                style: TextStyle(
                    fontSize: wordSize ?? 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                'O',
                style: TextStyle(
                    fontSize: wordSize ?? 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[400]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                'C',
                style: TextStyle(
                    fontSize: wordSize ?? 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                'K',
                style: TextStyle(
                    fontSize: wordSize ?? 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                'S',
                style: TextStyle(
                    fontSize: wordSize ?? 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[900]),
              ),
            )
          ],
        )
      ],
    );
  }
}
