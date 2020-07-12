import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theweatherapp/screens/city_screen.dart';
import 'package:theweatherapp/screens/compass.dart';
import 'package:theweatherapp/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:theweatherapp/services/location.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

String lCond = cond;
String lCity = city;
String lTemp = temp;
int lCondID = condID;
Position position = kp;

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    void reLocate() {
      //getLocations().whenComplete(() => getTempCity());
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CompassApp();
      }));
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.compass,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    reLocate();
                  });
                }),
            Text(lCity, style: kAppTextStyle),
            IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CityScreen()));
                }),
          ],
        ),
        centerTitle: true,
        backgroundColor: kAppBar,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15.0),
        decoration: kBoxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 2 * (MediaQuery.of(context).size.height / 4),
                    child: weatherImage),
                Container(
                    color: Colors.transparent,
                    height: 1 * (MediaQuery.of(context).size.height / 4),
                    child: Column(children: <Widget>[
                      Text(
                        lTemp ?? '00',
                        style: kAppTextStyle,
                      ),
                      Text(
                        lCond ?? 'thunder',
                        style: kAppTextStyle,
                      )
                    ])),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void getTempCity() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  temp = preferences.getString('temperature' ?? 'oo');
  cond = preferences.getString('condition' ?? 'Thunderstorm').toString();
  city = preferences.getString('city' ?? 'MeraSehar');
  condID = preferences.getInt('condID' ?? 400);
}
