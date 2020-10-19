import 'package:flutter/material.dart';
import 'package:portfolio/sidebar/sidebar_layout.dart';
import 'dart:io' show Platform;

void main() => runApp(PortFolio());

class PortFolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, primaryColor: Colors.white),
      home: Platform.isAndroid ? SideBarLayout() : SideBarLayout(),
    );
  }
}
