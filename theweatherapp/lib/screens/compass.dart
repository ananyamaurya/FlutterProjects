import 'package:flutter/material.dart';
import 'dart:async';
import 'package:compasstools/compasstools.dart';
import 'package:theweatherapp/utilities/constants.dart';

class CompassApp extends StatefulWidget {
  @override
  _CompassAppState createState() => _CompassAppState();
}

class _CompassAppState extends State<CompassApp> {
  int _haveSensor;
  String sensorType;

  @override
  void initState() {
    checkDeviceSensors();
    super.initState();
  }

  Future<void> checkDeviceSensors() async {
    int haveSensor;

    try {
      haveSensor = await Compasstools.checkSensors;

      switch (haveSensor) {
        case 0:
          {
            // statements;
            sensorType = "No sensors for Compass";
          }
          break;

        case 1:
          {
            //statements;
            sensorType = "Accelerometer + Magnetoneter";
          }
          break;

        case 2:
          {
            //statements;
            sensorType = "Gyroscope";
          }
          break;

        default:
          {
            //statements;
            sensorType = "Error!";
          }
          break;
      }
    } on Exception {}

    if (!mounted) return;

    setState(() {
      _haveSensor = haveSensor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: kAppBar,
          title: const Text('Compass example'),
        ),
        body: Container(
          decoration: kBoxDecoration,
          padding: EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: AlignmentDirectional.topCenter,
          child: Container(
            child: StreamBuilder(
              stream: Compasstools.azimuthStream,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: new RotationTransition(
                        turns: new AlwaysStoppedAnimation(-snapshot.data / 360),
                        child: Image.asset(
                          "images/compass.png",
                          height: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                  );
                } else
                  return Text("Error in stream");
              },
            ),
          ),
        ),
      ),
    );
  }
}
