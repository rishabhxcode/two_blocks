import 'package:flutter/material.dart';

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
            color: Colors.purple,
          ),
          ListTile(
            title: Text('Dark mode'),
            leading: Icon(
              Icons.brightness_2,
              color: Colors.deepPurple.shade900,
            ),
            trailing: Switch(
              value: true,
              onChanged: (bool) {},
            ),
          ),
          ListTile(
            title: Text('Language'),
            leading: Icon(Icons.language),
            onTap: (){},
          )
        ],
      ),
    );
  }
}
