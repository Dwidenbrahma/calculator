import 'package:calculator/screens/scientific_screen.dart';
import 'package:flutter/material.dart';
import 'package:calculator/components/text_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calculator/calculate.dart';

class Calculator extends StatefulWidget {
  static const id = 'simple_calculator';
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String text = '';
  String showResult = '';
  String history = '';
  bool isClicked = false;
  List<ListTile> historyList = [];
  bool _canAddDecimal(String currentText) {
    if (currentText.isEmpty || RegExp(r'[+\-*/]\s*$').hasMatch(currentText)) {
      return false;
    }

    final parts = currentText.split(RegExp(r'[+\-*/]'));

    final lastPart = parts.last.trim();

    if (lastPart.contains('.')) {
      return false;
    }
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'calculator',
            style: TextStyle(
                fontSize: 23.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ScientificScreen.id);
              },
              icon: Icon(
                Icons.calculate,
                size: 30.0,
                color: Color(0xFFFB4141),
              ),
            )
          ],
        ),
        backgroundColor: Color(0xFFFFFDF0),
        body: Column(
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
                  ...historyList,
                ],
              ),
            ),
            Divider(
              color: Color(0xFFBCCCDC),
              height: 5.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Textbutton(
                          text: '/',
                          onPressed: () {
                            setState(() {
                              if ( text.isEmpty ||text[0] == '/') {
                                text = '0/';
                              } else if (!RegExp(r'[\+\-\*/]$')
                                  .hasMatch(text)) {
                                text += '/';
                              }
                            });
                          },
                        ),
                        Textbutton(
                            text: '%',
                            onPressed: () {
                              setState(() {
                                if ( text.isEmpty||text[0] == '%') {
                                  text = '0%';
                                } else if (!RegExp(r'[\+\-\*/\%/]$')
                                    .hasMatch(text)) {
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
                              historyList.clear();
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
                                if (text.isEmpty||text[0] == '+') {
                                  text = '0+';
                                } else if (!RegExp(r'[\+\-\*/]$')
                                    .hasMatch(text)) {
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
                                if (text.isEmpty||text[0] == '-') {
                                  text = '0-';
                                } else if (!RegExp(r'[\+\-\*/]$')
                                    .hasMatch(text)) {
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
                                if (text.isEmpty||text[0] == '*') {
                                  text = '0*';
                                } else if (!RegExp(r'[\+\-\*/]$')
                                    .hasMatch(text)) {
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
                                if (text.isEmpty||text[0] == '^') {
                                  text = '0^';
                                } else if (!RegExp(r'[\+\-\*/]$')
                                    .hasMatch(text)) {
                                  text += '^';
                                }
                              },
                            );
                          },
                          text: '^',
                        ),
                        Textbutton(
                          onPressed: () {
                            setState(() {
                              // Check if it's valid to add a '.'
                              if (_canAddDecimal(text)) {
                                text += '.';
                              }
                            });
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

                                  history = "$text = $showResult";
                                  historyList.add(
                                    ListTile(
                                      title: Text(
                                        history,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.grey,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ),
                                  );
                                  text='';
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
        ),
      ),
    );
  }
}
