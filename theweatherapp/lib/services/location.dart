import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:theweatherapp/services/weather.dart';
import 'package:theweatherapp/utilities/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

String y, x;
Image weatherImage;
String cond, city, temp;
int condID;
Future<bool> getLocations() async {
  kp = await Geolocator().getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
      locationPermissionLevel: GeolocationPermission.locationAlways);
  print(kp);

  /*try {
    List<Placemark> placeMark =
        await Geolocator().placemarkFromCoordinates(kp.latitude, kp.longitude);
    kCity = (placeMark[0].subLocality.toString() +
            '  ' +
            placeMark[0].locality.toString()) ??
        'somedata';
    getData();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(locality, kCity);
    print(kCity);
  } on Exception catch (e) {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.getString(locality ?? 'Some Data');
    print(e);
  }*/
  getData();
  return true;
}

void getData() async {
  x = kp.latitude.toString();
  y = kp.longitude.toString();
  http.Response response = await http.get(
      "https://api.openweathermap.org/data/2.5/weather?lat=$x&lon=$y&appid=8f30d359cb0a705d74de735c0f4d5622");
  String data = response.body;
  if (response.statusCode == 200) {
    var temperature = (jsonDecode(data)['main']['temp']) - 273.15;
    var condition = jsonDecode(data)['weather'][0]['main'];
    var kCity = jsonDecode(data)['name'];
    var conditionId = jsonDecode(data)['weather'][0]['id'];
    temp = temperature.toStringAsFixed(1) + ' C';
    cond = condition.toString();
    city = kCity.toString();
    condID = conditionId.toInt();
    weatherImage = getWeatherIcon(condID);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('temperature', temp);
    preferences.setString('condition', cond);
    preferences.setString('city', city);
    preferences.setInt('condID', condID);
    print(kCity.toString() + city + condID.toString());
  }
}
