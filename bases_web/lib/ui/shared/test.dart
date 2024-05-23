import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
      return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints)
      {
        // Aqui calculamos la cantidad de columnas que necesitamos suponiendo lo que te decia, que un item ocupe entre el checkbox y el largo del name, 200 pixeles
        // Eso se puede hacer que si se sale de ese rango, muestre las ellipsis, y asi siempre tenemos un tamaño de widget fijo
        int crossAxisCount = constraints.maxWidth ~/
            200; //<===  aqui podemos poner el tamaño del row, eso en un container con el row de hijo, o un sixedbox, para tener un tamaño fijo

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: 5000, //<===  Esta es la cantidad de trabajadores
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: <Widget>[
                Checkbox(
                    value: false,
                    onChanged: (bool? newValue) {
                      //aqui iria la logica para modificar el trabajador, marcarlo o desmarcarlo
                    }),
                Expanded(
                  child: Text('Nombre Apellido $index'),
                ),
              ],
            );
          },
        );
      });
  }
}
