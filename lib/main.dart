import 'package:flutter/material.dart';
import 'package:calculator/screens/simple_calculator.dart';
import 'package:calculator/screens/scientific_screen.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  State<CalcApp> createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Calculator.id,
        routes: {
          Calculator.id: (context) => Calculator(),
          ScientificScreen.id: (context) => ScientificScreen()
        });
  }
}
