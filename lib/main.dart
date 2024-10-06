import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

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
  const CalculatorHome({super.key});

  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String displayText = "0"; // For showing the numbers and result

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Display area
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(
                displayText,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Number and Operator Buttons
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
              buildButton("C"), // Clear button
              buildButton("0"),
              buildButton("="),
              buildButton("+"),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to create buttons
  Widget buildButton(String label) {
    return InkWell(
      onTap: () {
        onButtonPressed(label);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void onButtonPressed(String label) {
    // Add logic to handle button press
  }
}