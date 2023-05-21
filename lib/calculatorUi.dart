import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcuatorUi extends StatefulWidget {
  const CalcuatorUi({super.key});

  @override
  State<CalcuatorUi> createState() => _CalcuatorUiState();
}

class _CalcuatorUiState extends State<CalcuatorUi> {
  String equation = '0';
  String result = '0';
  String expression = "";
  String res = '';

  var output = '';

  buttonpressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        equation = '';
        result = '';
      } else if (buttonText == '⌫') {
        if (equation.isNotEmpty) {
          equation = equation.substring(0, equation.length - 1);
        }
      } else if (equation == '0') {
        equation = buttonText;
        // } else if (buttonText == '+' ||
        //     buttonText == '-' ||
        //     buttonText == '÷' ||
        //     buttonText == '×') {
        // equation = int.parse(res).toString();
      } else if (buttonText == '=') {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel Cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, Cm)}';
        } catch (e) {
          result = 'error';
        }

        // result = int.parse(res).toString();
        // if (buttonText == '+') {
        //   output = (equation + result).toString();
        // }
        // if (buttonText == '-') {
        //   output = (equation - result).toString();
        // }
        // if (buttonText == '÷') {
        //   output = (equation / result).toString();
        // }
        // if (buttonText == '×') {
        //   output = (equation * result).toString();
        // }
      } else {
        equation = equation + buttonText;
      }
    });
  } //making the method for the button pressed

  // making the method for the container of button
  Widget buildButton(String buttonText, buttonColor,
      {Color? textColor, Color? bgColor}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: buttonColor,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              bgColor ?? Colors.black.withOpacity(0.7)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(200),
              side: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30.0, color: textColor ?? Colors.white),
        ),
        onPressed: () {
          buttonpressed(buttonText);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: 38.0),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: 48.0),
            ),
          ),
          Divider(),
          Container(
            child: Row(children: [
              Container(
                width: MediaQuery.of(context).size.width * .78,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton(
                        'C',
                        Color.fromARGB(255, 241, 234, 234),
                        textColor: Color.fromARGB(255, 241, 28, 39),
                      ),
                      buildButton('()', Color.fromARGB(255, 241, 234, 234)),
                      buildButton('%', Color.fromARGB(255, 241, 234, 234)),
                      buildButton('÷', Color.fromARGB(255, 241, 234, 234)),
                    ]),
                    TableRow(children: [
                      buildButton('7', Color.fromARGB(255, 241, 234, 234)),
                      buildButton('8', Color.fromARGB(255, 241, 234, 234)),
                      buildButton('9', Color.fromARGB(255, 241, 234, 234)),
                      buildButton('×', Color.fromARGB(255, 241, 234, 234)),
                    ]),
                    TableRow(children: [
                      buildButton('4', Color.fromARGB(255, 241, 234, 234)),
                      buildButton('5', Color.fromARGB(255, 241, 234, 234)),
                      buildButton('6', Color.fromARGB(255, 241, 234, 234)),
                      buildButton('-', Color.fromARGB(255, 241, 234, 234)),
                    ]),
                    TableRow(children: [
                      buildButton('1', Color.fromARGB(255, 241, 234, 234)),
                      buildButton('2', Color.fromARGB(255, 241, 234, 234)),
                      buildButton('3', Color.fromARGB(255, 241, 234, 234)),
                      buildButton('+', Color.fromARGB(255, 241, 234, 234)),
                    ]),
                    TableRow(children: [
                      buildButton('⌫', Color.fromARGB(255, 241, 234, 234)),
                      buildButton('0', Color.fromARGB(255, 241, 234, 234)),
                      buildButton('.', Color.fromARGB(255, 241, 234, 234)),
                      buildButton('=', Color.fromARGB(255, 255, 255, 255),
                          bgColor: Color.fromARGB(255, 3, 180, 9)),
                    ]),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
