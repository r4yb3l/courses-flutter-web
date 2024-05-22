import 'package:flutter/material.dart';
import 'package:bases_web/ui/counter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'stateful',
      routes: {
        'stateful': (context) => const CounterPage(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bases web'),
        ),
        body: Center(
          child: Container(
            child: const Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
