import 'dart:math';

import 'package:bases_web/ui/shared/custom_app_menu.dart';
import 'package:flutter/material.dart';
import 'package:random_name_generator/random_name_generator.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({super.key});

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  final List<String> workerNames = [];
  List<String> workerNamesVerticalOrder = [];

  @override
  void initState() {
    super.initState();
    fillWorkerNamesList();
    sortWorkerNamesList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //Esto para esperar a que se dibuje el widget antes de hacer el ajuste para tener acceso dinamico al ancho de la pantalla
      final int columns = (MediaQuery.of(context).size.width / 250).round();
      adjustListForVerticalOrder(columns);
      setState(() {});
    });
  }

  void fillWorkerNamesList() {
    for (int i = 0; i < 500; i++) {
      workerNames.add(RandomNames(Zone.spain).fullName());
    }
  }

  void adjustListForVerticalOrder(int columnCount) {
    List<String> adjustedList = List.filled(workerNames.length, '');
    int rowCount = (workerNames.length / columnCount).round();
    for (int i = 0; i < workerNames.length; i++) {
      int targetIndex = (i % rowCount) * columnCount + i ~/ rowCount;
      if (targetIndex < adjustedList.length) {
        adjustedList[targetIndex] = workerNames[i];
      }
    }
    workerNamesVerticalOrder = adjustedList;
  }

  void sortWorkerNamesList() {
    workerNames.sort();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const itemWidth = 250;

    return LayoutBuilder(
      builder: (context, viewport) {
        int columnCount = (viewport.maxWidth / itemWidth).round();
        adjustListForVerticalOrder(columnCount);
        return Scaffold(
          body: Column(
            children: [
              const CustomAppMenu(),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (size.width / itemWidth).round(),
                      // Ya con esto se consigue la responsividad!!!
                      crossAxisSpacing: 40,
                      childAspectRatio: 4),
                  itemCount: workerNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomRow(
                      workerName: workerNamesVerticalOrder[index],
                      isSelected: Random().nextInt(8) % index % 3 == 0,
                      itemWidth: itemWidth,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomRow extends StatefulWidget {
  const CustomRow(
      {super.key,
      required this.isSelected,
      required this.workerName,
      required this.itemWidth});

  final bool isSelected;
  final String workerName;
  final int itemWidth;

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      width: widget.itemWidth.toDouble(),
      // Control del tamaño fijo del widget para luego cuando llegue a responsive ese valor me sirva para calcular la cantidad de elementos que se pueden pintar en la vista
      height: 40,
      child: Row(
        children: [
          Checkbox(
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value!;
              });
            },
          ),
          Expanded(
            child: Text(
              widget.workerName,
              style: const TextStyle(
                fontSize: 16,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
