import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Contador $counter',
            style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: Text('Incrementar'))
        ],
      ),
    );
  }
}
