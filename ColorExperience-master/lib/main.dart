import 'package:flutter/material.dart';
import './Screens/FirstPage.dart';
import 'fruit.dart';
import 'user.dart';
import 'Screens/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/feedbacks.dart';

void main() => runApp(YourColor());

class YourColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: FirstPage(),
      ),
    );
  }
}

class Test extends StatefulWidget {
  Test({attempts});
  static int attempts;
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Widget build(BuildContext context) {
    if ((Test.attempts == 0) || (Test.attempts == 1)) {
      print(Test.attempts);
      //setAttempts_0();
      return Stack(
        children: <Widget>[
          Home(),
          Text("heeeellllllloooooo ${Test.attempts}"),
        ],
      );
    } else {
      print("hello");
      // _loadAttempts();
      return Feedbacks();
    }
  }
}
