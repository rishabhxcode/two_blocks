import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  // bool _themeSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 100,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Text(
                      '  2',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange[700]),
                    ),
                    Text(
                      ' Blocks',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.purpleAccent.shade700,
                          fontWeight: FontWeight.bold),
                    )
                  ],
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
                onTap: () {},
              ),
              ListTile(
                title: Text('Help'),
                leading: Icon(
                  Icons.help_outline,
                  color: Colors.deepPurple.shade900,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text('Share'),
                leading: Icon(
                  Icons.share,
                  color: Colors.deepPurple.shade900,
                ),
                onTap: () {},
              ),
              // ListTile(
              //   title: Text('Dark Theme'),
              //   leading: Icon(
              //     Icons.brightness_3,
              //     color: Colors.deepPurple.shade900,
              //   ),
              //   trailing: Switch(
              //     value: _themeSwitch,
              //     onChanged: (val) {
              //       _themeSwitch = val;
              //       setState(() {});
              //     },
              //   ),
              // )
            ],
          ),
          ListTile(
            title: Text('Report a bug'),
            leading: Icon(
              Icons.bug_report,
              color: Colors.deepPurple.shade900,
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
