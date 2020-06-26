import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:math';

void main() {
  runApp(RandomNumberSelector());
}

class RandomNumberSelector extends StatefulWidget {
  @override
  _RandomNumberSelectorState createState() => _RandomNumberSelectorState();
}

class _RandomNumberSelectorState extends State<RandomNumberSelector> {
  int randomNumber = 1;
  int _currentValue = 1;
  void randomNumbers() {
    setState(() {
      randomNumber = Random().nextInt(_currentValue) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Number Selector',
      home: Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          title: Text(
            'Select a number',
          ),
          backgroundColor: Colors.blue[900],
        ),
        body: Column(
          children: [
            Center(
              child: new NumberPicker.integer(
                  initialValue: _currentValue,
                  minValue: 0,
                  maxValue: 100,
                  onChanged: (newValue) =>
                      setState(() => _currentValue = newValue)),
            ),
            new Text(
              "Current number: $_currentValue",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: randomNumbers,
                child: Text(
                  "$randomNumber",
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
