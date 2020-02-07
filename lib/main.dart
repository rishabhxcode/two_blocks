import 'package:flutter/material.dart';
import 'package:two_blocks/screens/drawer.dart';
import 'package:two_blocks/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '2 blocks',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
        primaryColor: Colors.grey.shade200,
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
      color: Colors.indigo,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                      child: AppBar(
                        backgroundColor: Colors.grey.shade200,
                      ),
                    ),
                    Center(
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 5.0,
                        child: Container(
                          height: 250,
                          width: 280,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              )
            ],
          ),
          drawer: AppDrawer(),
        ),
      ),
    );
  }
}
