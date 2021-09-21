// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:myapp/screens/bmi_screen.dart';
import 'package:myapp/screens/intro_screen.dart';

void main() {
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blueGrey), 
        routes: {
          '/': (context) => IntroScreen(),
          '/bmi': (context) => BmiScreen(),
        },
        initialRoute: '/',
        //home: IntroScreen()
        );
  }
}
