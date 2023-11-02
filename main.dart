import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'calculator_screen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/calculator': (context) => CalculatorScreen(),
    },
  ));
}
