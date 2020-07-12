import 'package:flutter/material.dart';
import 'price_screen.dart';
import 'coin_data.dart';
CurrencyRequest cr = new CurrencyRequest();
void main() {
  cr.updateCurrencies('AUD').whenComplete(() => runApp(MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white),
      home: PriceScreen(),
    );
  }
}
