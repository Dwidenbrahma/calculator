import 'package:flutter/material.dart';
import 'package:calculator/calculate.dart';

class ScientificScreen extends StatefulWidget {
  static const id = 'scientific_screen';
  const ScientificScreen({super.key});

  @override
  State<ScientificScreen> createState() => _ScientificScreenState();
}

class _ScientificScreenState extends State<ScientificScreen> {
  Calculate calculate = Calculate(result: 'sqrt(100)');
  String m = '';

  void printResult() {
    m = calculate.getResult();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'scientific calculator',
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w900,
                fontFamily: 'Poppins',
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: <Widget>[

              Container(
                width: 500.0,
                height: 300.0,
                padding: EdgeInsets.all(10.0),
                color: Color(0xFFF0F0D7),
                alignment: Alignment.bottomRight,
                child: Text('$m', style: TextStyle(
                  fontSize: 30.0,
                  
                ),),
                
              ),
              
              Container(
                color: Color(0xFF727D73),
                width: 500.0,
                height: 403.2,
                child: Row(),
              )

            ],
          )),
    );
  }
}

