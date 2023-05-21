import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '';
  String _currentNumber = '';
  double _firstOperand = '' as double;
  String _operation = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        _performOperation();
      } else if (buttonText == 'C') {
        _clear();
      } else if (buttonText == '.') {
        _addDecimal();
      } else {
        _currentNumber += buttonText;
      }
    });
  }

  void _performOperation() {
    double secondOperand = double.parse(_currentNumber);

    switch (_operation) {
      case '+':
        _output = (_firstOperand + secondOperand).toString();
        break;
      case '-':
        _output = (_firstOperand - secondOperand).toString();
        break;
      case '*':
        _output = (_firstOperand * secondOperand).toString();
        break;
      case '/':
        if (secondOperand != 0) {
          _output = (_firstOperand / secondOperand).toString();
        } else {
          _output = 'Error: Division by zero';
        }
        break;
    }

    _currentNumber = '';
    _firstOperand = '' as double;
    _operation = '';
  }

  void _clear() {
    _output = '';
    _currentNumber = '';
    _firstOperand = '' as double;
    _operation = '';
  }

  void _addDecimal() {
    if (!_currentNumber.contains('.')) {
      _currentNumber += '.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: 16,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (BuildContext context, int index) {
                List<String> buttons = [
                  '7',
                  '8',
                  '9',
                  '/',
                  '4',
                  '5',
                  '6',
                  '*',
                  '1',
                  '2',
                  '3',
                  '-',
                  'C',
                  '0',
                  '=',
                  '+',
                  '.',
                ];
                return GestureDetector(
                  onTap: () {
                    _buttonPressed(buttons[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      buttons[index],
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
