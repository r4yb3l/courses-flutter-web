import 'package:bases_web/ui/shared/custom_app_menu.dart';
import 'package:bases_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

class CounterProviderPage extends StatefulWidget {
  const CounterProviderPage({super.key});

  @override
  State<CounterProviderPage> createState() => _CounterProviderPageState();
}

class _CounterProviderPageState extends State<CounterProviderPage> {
  int counter = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomAppMenu(),
          const Spacer(),
          Text(
            'Contador Provider',
            style: TextStyle(fontSize: 20),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Contador $counter',
              style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFlatButton(
                  text: 'Incrementar',
                  color: Colors.green,
                  onPressed: () => setState(() => counter++)),
              const SizedBox(width: 20),
              CustomFlatButton(
                  text: 'Decrementar',
                  color: Colors.red,
                  onPressed: () => setState(() => counter--)),
            ],
          ),
          const Spacer()
        ],
      ),
    );
  }
}
