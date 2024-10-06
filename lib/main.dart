import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalculatorApp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String displayText = "0"; 
  String operand1 = ""; // Stores the first operand
  String operand2 = ""; // Stores the second operand
  String operator = ""; // Stores the operator
  bool isOperatorSelected = false; // Tracks if the operator is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(
                displayText,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("/"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("*"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("-"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton("C"),
              buildButton("0"),
              buildButton("="),
              buildButton("+"),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(String label) {
    return InkWell(
      onTap: () {
        onButtonPressed(label);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void onButtonPressed(String label) {
    setState(() {
      if (label == "C") { // Clear button logic
        displayText = "0";
        operand1 = "";
        operand2 = "";
        operator = "";
        isOperatorSelected = false;
      } else if (label == "=") { // Equals button logic
        if (operand1.isNotEmpty && operand2.isNotEmpty && operator.isNotEmpty) {
          double result = calculate();
          displayText = result.toString();
          operand1 = result.toString(); // Store result as operand1 for further calculations
          operand2 = "";
          operator = "";
          isOperatorSelected = false;
        }
      } else if ("+-*/".contains(label)) { // Operator button logic
        if (operand1.isNotEmpty) {
          operator = label;
          isOperatorSelected = true;
        }
      } else { // Number button logic
        if (isOperatorSelected) { // Append to operand2 if an operator is already selected
          operand2 += label;
          displayText = operand2;
        } else { // Append to operand1
          operand1 += label;
          displayText = operand1;
        }
      }
    });
  }

  double calculate() {
    double num1 = double.parse(operand1);
    double num2 = double.parse(operand2);
    switch (operator) {
      case "+":
        return num1 + num2;
      case "-":
        return num1 - num2;
      case "*":
        return num1 * num2;
      case "/":
        return num2 != 0 ? num1 / num2 : double.infinity; // Handle division by zero
      default:
        return 0.0;
    }
  }
}