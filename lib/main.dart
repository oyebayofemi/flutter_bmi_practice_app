import 'package:bmi_practice_app/screens/bmi_calculator.dart';
import 'package:bmi_practice_app/screens/show_bmi.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //home: BMICalc(),
    initialRoute: '/home',
    routes: {
      '/home': (context) => BMICalc(),
      '/show': (context) => ViewBMI(),
    },
  ));
}
