import 'package:flutter/material.dart';
import 'button_widget.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '0';
  String _input = '0';
  String _ope = '';
  double num1 = 0;
  double num2 = 0;

  void buttonPress(String value) {
    setState(() {
      if (value == 'AC') {
        _output = '0';
        _input = '0';
        _ope = '';
        num1 = 0;
        num2 = 0;
      }
      else if (value == '=') {
        num2 = double.tryParse(_input.isEmpty ? '0' : _input) ?? 0;
        switch (_ope) {
          case '+':
            _output = (num1 + num2).toString();
            break;
          case '-':
            _output = (num1 - num2).toString();
            break;
          case '*':
            _output = (num1 * num2).toString();
            break;
          case '÷':
            _output = num2 != 0 ? (num1 / num2).toString() : 'Error';
            break;
          case '%':
            _output = (num1 * num2 / 100).toString();
            break;
          default:
            break;
        }
        _input = _output;
        _ope = '';
      }
      else if (['+', '-', '*', '÷', '%'].contains(value)) {
        num1 = double.tryParse(_input.isEmpty ? '0' : _input) ?? 0;
        _ope = value;
        _output = '$num1 $_ope';
        _input = '';
      }
      else if (value == '.') {
        if (!_input.contains('.')) {
          _input += '.';
        }
      }
      else {
        if (_input == '0' || _input.isEmpty) {
          _input = value;
        } else {
          _input += value;
        }
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _ope.isNotEmpty ? '$num1 $_ope' : '',
                      style: const TextStyle(color: Colors.white70, fontSize: 30),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _input.isNotEmpty ? _input : _output,
                      style: const TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),



            // 7–9 Row
            Row(
              children: [
                ButtonWidget(onClick: () => buttonPress('7'), text: '7'),
                ButtonWidget(onClick: () => buttonPress('8'), text: '8'),
                ButtonWidget(onClick: () => buttonPress('9'), text: '9'),
                ButtonWidget(onClick: () => buttonPress('÷'), text: '÷', color: Colors.orange),
              ],
            ),

            // 4–6 Row
            Row(
              children: [
                ButtonWidget(onClick: () => buttonPress('4'), text: '4'),
                ButtonWidget(onClick: () => buttonPress('5'), text: '5'),
                ButtonWidget(onClick: () => buttonPress('6'), text: '6'),
                ButtonWidget(onClick: () => buttonPress('*'), text: '*', color: Colors.orange),
              ],
            ),

            // 1–3 Row
            Row(
              children: [
                ButtonWidget(onClick: () => buttonPress('1'), text: '1'),
                ButtonWidget(onClick: () => buttonPress('2'), text: '2'),
                ButtonWidget(onClick: () => buttonPress('3'), text: '3'),
                ButtonWidget(onClick: () => buttonPress('-'), text: '-', color: Colors.orange),
              ],
            ),

            // 0 Row (4 buttons)
            Row(
              children: [
                ButtonWidget(onClick: () => buttonPress('%'), text: '%'),
                ButtonWidget(onClick: () => buttonPress('0'), text: '0'),
                ButtonWidget(onClick: () => buttonPress('.'), text: '.'),
                ButtonWidget(onClick: () => buttonPress('+'), text: '+', color: Colors.orange),
              ],
            ),

            // Last Row (also 4 buttons ✅)
            Row(
              children: [
                ButtonWidget(onClick: () => buttonPress('AC'), text: 'AC', color: Colors.red),
                ButtonWidget(onClick: () => buttonPress('('), text: '('),
                ButtonWidget(onClick: () => buttonPress(')'), text: ')'),
                ButtonWidget(onClick: () => buttonPress('='), text: '=', color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
