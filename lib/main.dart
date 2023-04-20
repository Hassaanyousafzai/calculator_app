import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  MyHomeApp({super.key});

  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  String title = 'Calculator';
  String _output = "0";
  String output = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  buttonPressed(String buttonText) {
    if (buttonText == "Clear") {
      output = "0";
      num1 = 0;
      num2 = 0;
      operand = "0";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      num1 = double.parse(_output);
      operand = buttonText;
      output = "";
    } else if (buttonText == ".") {
      if (output.contains(".")) {
        print("Already contains Decimal");
      } else {
        output = output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(_output);
      if (operand == "+") {
        output = (num1 + num2).toString();
      } else if (operand == "-") {
        output = (num1 - num2).toString();
      } else if (operand == "*") {
        output = (num1 * num2).toString();
      } else if (operand == "/") {
        output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      output = output + buttonText;
    }

    setState(() {
      _output = double.parse(output).toStringAsFixed(0);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: OutlinedButton(
            onPressed: () => buttonPressed(buttonText),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.amber[400],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton2(String buttonText) {
    return Expanded(
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            onPressed: () => buttonPressed(buttonText),
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            alignment: Alignment.centerRight,
            child: Text(
              _output,
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.amber[200],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton2('+')
                ],
              ),
              Row(
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton2('-')
                ],
              ),
              Row(
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton2('*')
                ],
              ),
              Row(
                children: [
                  buildButton('.'),
                  buildButton('0'),
                  buildButton('00'),
                  buildButton2('/')
                ],
              ),
              Row(
                children: [
                  buildButton('Clear'),
                  buildButton('='),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
