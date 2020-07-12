import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theweatherapp/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select City',
          style: kAppTextStyle,
        ),
        centerTitle: true,
        backgroundColor: kAppBar,
      ),
      body: Container(
        decoration: kBoxDecoration,
        child: SafeArea(
          child: Center(
              child: Column(
            children: <Widget>[
              TextField(
                textAlign: TextAlign.center,
              )
            ],
          )),
        ),
      ),
    );
  }
}
