import 'package:flutter/material.dart';
import 'package:two_blocks/screens/drawer.dart';
import 'package:two_blocks/screens/home_screen.dart';
import 'package:two_blocks/widgets/neu_button.dart';

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
        primaryColor: Colors.grey[100],
        accentColor: Colors.grey[200],
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
      color: Theme.of(context).accentColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).accentColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.grey[800]),
          ),
          drawer: AppDrawer(),
          body: HomeScreen()
        ),
      ),
    );
  }
}
