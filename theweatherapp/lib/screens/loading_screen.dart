import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theweatherapp/utilities/constants.dart';
import 'package:theweatherapp/screens/location_screen.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:theweatherapp/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: kBoxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              height: MediaQuery.of(context).size.height / 9,
              child: Center(
                child: Text(
                  'TheWeatherApp',
                  style: kButtonTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SplashScreen.navigate(
              name: 'assets/Loading.flr',
              next: (_) => LocationScreen(),
              until: () => getLocations().whenComplete(() => getData()),
              startAnimation: 'Alarm',
            ),
          ),
        ],
      ),
    );
  }
}
