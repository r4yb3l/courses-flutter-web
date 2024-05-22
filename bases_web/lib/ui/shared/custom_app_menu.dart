import 'package:bases_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            CustomFlatButton(text: 'Contador Stateful', onPressed: () {}, color: Colors.red,),
            const SizedBox(width: 10),
            CustomFlatButton(text: 'Contador con Provider', onPressed: () {}, color: Colors.black,),
            const SizedBox(width: 10),
            CustomFlatButton(text: 'Otra pagina', onPressed: () {}, color: Colors.black,),
          ],
        ),
      ),
    );
  }
}
