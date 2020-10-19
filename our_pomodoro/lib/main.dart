
import 'dart:async';
import 'dart:html';

import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:our_pomodoro/pomodoroSettings/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our Pomodoro',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Our Pomodoro'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  Timer t;
  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    AnimationController controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    Key _reloadKey = Key("Relodable Timer");
    void reloadSomething(){
      setState(() {
          build(context);
      });
    }
    t = Timer(duration:Duration(seconds: kSessionDurationMinutes));
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title,style: TextStyle(
          fontSize: 26
        ),),
        actions: [
          Padding(
            padding: EdgeInsets.all(5),
            child: DigitalClock(
              digitAnimationStyle: Curves.elasticOut,
              is24HourTimeFormat: false,
              areaDecoration: BoxDecoration(
                color: Colors.transparent,

              ),
              hourMinuteDigitTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
              amPmDigitTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
      drawer: Drawer(elevation: 4.0,
        child: ListView(
          children: [
            DrawerHeader(child: Container(
              constraints: BoxConstraints.loose(Size(100,200)),
              child: Center(
                child: Text("I'm Header"),
              ),
            ))

          ],
        ),),
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: (MediaQuery.of(context).size.width) / 3,
      
      body: Center(
        key: _reloadKey,
        child:
        
      ),
    );
  }
}
