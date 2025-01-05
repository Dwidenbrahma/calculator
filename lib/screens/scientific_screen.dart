import 'package:flutter/material.dart';

class ScientificScreen extends StatefulWidget {
  static const id = 'scientific_screen';
  const ScientificScreen({super.key});

  @override
  State<ScientificScreen> createState() => _ScientificScreenState();
}

class _ScientificScreenState extends State<ScientificScreen> {
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


          ],
        ),
      ),
    );
  }
}
