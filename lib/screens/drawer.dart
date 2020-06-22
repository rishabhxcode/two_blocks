import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 100,
            alignment: Alignment.centerLeft,
            child: Text(
              '         logo',
              style: TextStyle(fontSize: 18),
            ),
            decoration: BoxDecoration(color: Constants.BGColor, boxShadow: [
              BoxShadow(
                  color: Constants.DarkShadow,
                  offset: Offset(0, 1),
                  blurRadius: 1,
                  spreadRadius: 0)
            ]),
          ),
          ListTile(
            title: Text('About'),
            leading: Icon(
              Icons.info_outline,
              color: Colors.deepPurple.shade900,
            ),
          ),
          ListTile(
            title: Text('Help'),
            leading: Icon(
              Icons.help_outline,
              color: Colors.deepPurple.shade900,
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
