import 'package:flutter/material.dart';

import 'example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'JNIgen Demo',
      home: Adder(),
    );
  }
}

class Adder extends StatefulWidget {
  const Adder({super.key});

  @override
  State<Adder> createState() => _AdderState();
}

class _AdderState extends State<Adder> {
  var firstValue = 0;
  var secondValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                firstValue = int.tryParse(value) ?? 0;
              });
            },
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                secondValue = int.tryParse(value) ?? 0;
              });
            },
          ),
          // Here we're using the Java method directly from Dart!
          Text('Sum is ${Example.sum(firstValue, secondValue)}'),
        ],
      ),
    );
  }
}
