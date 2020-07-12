import 'package:flutter/material.dart';
  Image getWeatherIcon(int condition) {
    if (condition < 300) {
      return Image.asset('images/rainthunder.png');
    } else if (condition < 400) {
      return Image.asset('images/rainslow.png');
    } else if (condition < 600) {
      return Image.asset('images/umbrella.png');
    } else if (condition < 700) {
      return Image.asset('images/snow.png');
    } else if (condition < 800) {
      return Image.asset('images/wind.png');
    } else if (condition == 800) {
      return Image.asset('images/sun.png');
    } else if (condition <= 804) {
      return Image.asset('images/clouds.png');
    } else {
      return Image.asset('images/default.png');
    }
  }
