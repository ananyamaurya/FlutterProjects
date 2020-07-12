import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);
String lat = 'latitude';
String long = 'longitude';
String locality = 'city';
Position kp;
const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);
Color kAppBar = Colors.indigo[900];
BoxDecoration kBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
      Colors.indigo[900],
      Colors.indigo[800],
      Colors.blue[800],
      Colors.cyan[800]
    ]));

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  color: Colors.white,
  fontFamily: 'Spartan MB',
);

const kAppTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
