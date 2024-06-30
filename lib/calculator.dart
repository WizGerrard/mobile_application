import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double _num1 = 0;
  double _num2 = 0;
  String _result = '0';
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  void _calculate(String operator) {
    setState(() {
      _num1 = double.tryParse(_controller1.text) ?? 0;
      _num2 = double.tryParse(_controller2.text) ?? 0;

      switch (operator) {
        case '+':
          _result = (_num1 + _num2).toString();
          break;
        case '-':
          _result = (_num1 - _num2).toString();
          break;
        case '*':
          _result = (_num1 * _num2).toString();
          break;
        case '/':
          _result = (_num2 != 0) ? (_num1 / _num2).toString() : 'Error';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Simple Calculator',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller1,
            decoration: const InputDecoration(
              labelText: 'First Number',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller2,
            decoration: const InputDecoration(
              labelText: 'Second Number',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _calculate('+'),
                child: const Text('+'),
              ),
              ElevatedButton(
                onPressed: () => _calculate('-'),
                child: const Text('-'),
              ),
              ElevatedButton(
                onPressed: () => _calculate('*'),
                child: const Text('*'),
              ),
              ElevatedButton(
                onPressed: () => _calculate('/'),
                child: const Text('/'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Result: $_result',
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
