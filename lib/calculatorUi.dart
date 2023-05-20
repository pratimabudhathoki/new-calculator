import 'dart:js_util';

import 'package:flutter/material.dart';

class CalcuatorUi extends StatefulWidget {
  const CalcuatorUi({super.key});

  @override
  State<CalcuatorUi> createState() => _CalcuatorUiState();
}

class _CalcuatorUiState extends State<CalcuatorUi> {
  String equation = '0';
  String result = '0';
  String expression = "";
  buttonpressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        equation == null;
        result == null;
      } else if (buttonText == '=') {
      } else if (buttonText == '⌫') {
        equation.substring(equation.length - 1);
      } else if (equation == 0) {
        equation = buttonText;
      } else {
        equation = equation + buttonText;
      }
    });
  } //making the method for the button pressed

  // making the method for the container of button
  Widget buildButton(String buttonText, buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: buttonColor,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30.0, color: Colors.white),
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
              equation,
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
                      buildButton('C', Colors.red),
                      buildButton('()', Colors.red),
                      buildButton('%', Colors.red),
                      buildButton('÷', Colors.red),
                    ]),
                    TableRow(children: [
                      buildButton('7', Colors.red),
                      buildButton('8', Colors.red),
                      buildButton('9', Colors.red),
                      buildButton('×', Colors.red),
                    ]),
                    TableRow(children: [
                      buildButton('4', Colors.red),
                      buildButton('5', Colors.red),
                      buildButton('6', Colors.red),
                      buildButton('-', Colors.red),
                    ]),
                    TableRow(children: [
                      buildButton('1', Colors.red),
                      buildButton('2', Colors.red),
                      buildButton('3', Colors.red),
                      buildButton('+', Colors.red),
                    ]),
                    TableRow(children: [
                      buildButton('⌫', Colors.red),
                      buildButton('0', Colors.red),
                      buildButton('.', Colors.red),
                      buildButton('=', Colors.red),
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
