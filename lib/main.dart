import 'package:calculator1/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var userInput = '';
  var answer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '+/-',
    '0',
    ',',
    '=',
  ];

  var _result = 0;

  void _add() {
    setState(() {
      _result = _result + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userInput,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Buttons(
                        buttonTapped: () {
                          setState(() {
                            userInput = '';
                          });
                        },
                        buttontext: buttons[index],
                        color: Colors.red,
                        textcolor: Colors.white,
                      );
                    }
                    if (index == 1) {
                      return Buttons(
                        buttonTapped: () {
                          setState(() {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                          });
                        },
                        buttontext: buttons[index],
                        color: Colors.white10,
                        textcolor: Colors.red,
                      );
                    }
                    if (index == buttons.length - 1) {
                      return Buttons(
                        buttonTapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                        buttontext: buttons[index],
                        color: Colors.blue,
                        textcolor: Colors.white,
                      );
                    }
                    return Buttons(
                      buttonTapped: () {
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                      buttontext: buttons[index],
                      color: Colors.green,
                      textcolor: Colors.white,
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }

  equalPressed() {
    String finalQuestion = userInput;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    answer = eval.toString();
  }
}
