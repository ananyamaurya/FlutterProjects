import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    const TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    const List<Widget> _widgetOptions = <Widget>[
      Text(
        'Index 0: Home',
        style: optionStyle,
      ),
      Text(
        'Index 1: Likes',
        style: optionStyle,
      ),
      Text(
        'Index 2: Search',
        style: optionStyle,
      ),
      Text(
        'Index 3: Profile',
        style: optionStyle,
      ),
    ];
    int _page = 0;
    return Scaffold(
      extendBodyBehindAppBar: true,

      backgroundColor: Theme.of(context).canvasColor,
      extendBody: true,

      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Icon(
                      Icons.ac_unit,
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Home")
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    Icon(
                      Icons.ac_unit,
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Home")
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    Icon(
                      Icons.ac_unit,
                      size: 20.0,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Home")
                  ],
                ),
              )
            ],
          )),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),

      body: Column(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/ananya.jpeg"),
                        fit: BoxFit.cover)),
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [Text("data")],
                  )
                ])),
          ]),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
