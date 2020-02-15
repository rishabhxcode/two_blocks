import 'package:flutter/material.dart';
import 'package:two_blocks/screens/drawer.dart';
import 'package:two_blocks/widgets/neo_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '2 blocks',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
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
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.grey[800]),
            
          ),
          drawer: AppDrawer(),
          body: Center(
            child: NeoButton(
              fillColor: Colors.grey.shade200,
              height: 50,
              width: 150,
              onTap: () {},
              border: Border.all(color: Colors.yellow.shade700.withOpacity(0.5), width: 2.0),
              child: Text('1 Block', style: TextStyle(color: Colors.grey.shade700, fontSize: 18),),
              highLightColor: Colors.transparent,
              //  gradient: LinearGradient(
              // begin: Alignment.centerLeft,
              // end: Alignment.centerRight,
              // colors: [
              //    Colors.grey[300],
              //   Colors.grey[200],
              //   Colors.grey[200],
              //   Colors.grey[300],
              //   Colors.grey[300]
              // ])
            ),
          ),
        ),
      ),
    );
  }
}

