import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      BallPage(),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue.shade800,
          title: Text('Ask Me Anything'),
        ),
        body: Ball(),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int numb = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Expanded(
          child: Container(
              child: FlatButton(
                  onPressed: () {
                    setState(() {
                      numb = Random().nextInt(5) + 1;
                    });
                  },
                  child: Image.asset('images/ball$numb.png')))),
    );
  }
}
