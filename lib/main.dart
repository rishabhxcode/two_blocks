import 'package:flutter/material.dart';
import 'package:two_blocks/screens/drawer.dart';
import 'package:two_blocks/screens/home.dart';
import 'package:two_blocks/screens/playground.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
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
    return Scaffold(
      drawer: AppDrawer(),
        appBar: AppBar(
          title: Text('2 Blocks'),
        ),
        body:HomeScreen()
        );
  }
}
