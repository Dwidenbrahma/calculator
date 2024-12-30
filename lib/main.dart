import 'package:flutter/material.dart';
import 'calculate.dart';
import 'package:calculator/components/text_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFFFFDF0),
          body: Calculator(),
        ),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String text = '';
  String showResult = '';
  String history = '';
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: ListView(
            reverse: true,
            children: <Widget>[
              ListTile(
                title: Text(
                  text,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  showResult.isNotEmpty ? showResult : '',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  history,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Color(0xFFBCCCDC),
          height: 10.0,
          indent: 20.0,
          endIndent: 20.0,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Textbutton(
                      text: '/',
                      onPressed: () {
                        setState(() {
                          if (text[0] == '/') {
                            text = '0/';
                          } else if (!RegExp(r'[\+\-\*/]$').hasMatch(text)) {
                            text += '/';
                          }
                        });
                      },
                    ),
                    Textbutton(
                        text: '%',
                        onPressed: () {
                          setState(() {
                            if (text[0] == '%') {
                              text = '0%';
                            } else if (!RegExp(r'[\+\-\*/\%/]$').hasMatch(text)) {
                              text += '%';
                            }
                          });
                        }),
                    Textbutton(
                      text: 'AC',
                      onPressed: () {
                        setState(() {
                          history = '';
                          text = '';
                          showResult = '';
                        });
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          text = text.substring(0, text.length - 1);
                        });
                      },
                      child: Icon(
                        FontAwesomeIcons.deleteLeft,
                        size: 30.0,
                        color: Color(0xFFFB4141),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Textbutton(
                      text: '+',
                      onPressed: () {
                        setState(
                          () {
                            if (text[0] == '+') {
                              text = '0+';
                            } else if (!RegExp(r'[\+\-\*/]$').hasMatch(text)) {
                              text += '+';
                            }
                          },
                        );
                      },
                    ),
                    Textbutton(
                        onPressed: () {
                          setState(
                            () {
                              text += '1';
                            },
                          );
                        },
                        text: '1'),
                    Textbutton(
                      onPressed: () {
                        setState(
                          () {
                            text += '2';
                          },
                        );
                      },
                      text: '2',
                    ),
                    Textbutton(
                      onPressed: () {
                        setState(
                          () {
                            text += '3';
                          },
                        );
                      },
                      text: '3',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Textbutton(
                      onPressed: () {
                        setState(
                          () {
                            if (text[0] == '-') {
                              text = '0-';
                            } else if (!RegExp(r'[\+\-\*/]$').hasMatch(text)) {
                              text += '-';
                            }
                          },
                        );
                      },
                      text: '-',
                    ),
                    Textbutton(
                      onPressed: () {
                        setState(
                          () {
                            text += '4';
                          },
                        );
                      },
                      text: '4',
                    ),
                    Textbutton(
                      onPressed: () {
                        setState(
                          () {
                            text += '5';
                          },
                        );
                      },
                      text: '5',
                    ),
                    Textbutton(
                      onPressed: () {
                        setState(
                          () {
                            text += '6';
                          },
                        );
                      },
                      text: '6',
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Textbutton(
                      onPressed: () {
                        setState(
                          () {
                            if (text[0] == '*') {
                              text = '0*';
                            } else if (!RegExp(r'[\+\-\*/]$').hasMatch(text)) {
                              text += '*';
                            }
                          },
                        );
                      },
                      text: '*',
                    ),
                    Textbutton(
                      onPressed: () {
                        setState(
                          () {
                            text += '7';
                          },
                        );
                      },
                      text: '7',
                    ),
                    Textbutton(
                      onPressed: () {
                        setState(
                          () {
                            text += '8';
                          },
                        );
                      },
                      text: '8',
                    ),
                    Textbutton(
                      onPressed: () {
                        setState(
                          () {
                            text += '9';
                          },
                        );
                      },
                      text: '9',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Textbutton(
                      onPressed: () {
                        setState(
                          () {
                            if (text[0] == '^') {
                              text = '0^';
                            } else if (!RegExp(r'[\+\-\*/]$').hasMatch(text)) {
                              text += '^';
                            }
                          },
                        );
                      },
                      text: '^',
                    ),
                    Textbutton(
                      onPressed: () {
                        setState(
                          () {
                            text += '.';
                          },
                        );
                      },
                      text: '.',
                    ),
                    Textbutton(
                      onPressed: () {
                        setState(
                          () {
                            text += '0';
                          },
                        );
                      },
                      text: '0',
                    ),
                    Textbutton(
                      onPressed: () {
                        setState(
                          () {
                            Calculate calculate = Calculate(result: text);

                            if (text != '') {
                              showResult = calculate.getResult();
                            }
                          },
                        );
                      },
                      text: '=',
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
