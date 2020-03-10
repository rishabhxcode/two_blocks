import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';
import 'package:two_blocks/screens/drawer.dart';
import 'package:two_blocks/screens/home_screen.dart';
import 'package:two_blocks/screens/one_block_playground.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '2 blocks',
      theme: ThemeData(
        fontFamily: 'varela',
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        primaryColor: Constants.BGColor,
        accentColor: Constants.BGColor,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.BGColor,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Constants.BGColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.grey[800]),
            ),
            drawer: AppDrawer(),
            body: HomeScreen()),
      ),
    );
  }
}
