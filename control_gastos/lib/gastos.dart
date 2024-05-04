import 'package:control_gastos/grafica.dart';
import 'package:control_gastos/new_gasto.dart';
import 'package:flutter/material.dart';
import 'package:control_gastos/modelos/gasto.dart';
import 'package:control_gastos/lista_gastos.dart';
import 'package:flutter/widgets.dart';

class Gastos extends StatefulWidget {
  @override
  State<Gastos> createState() {
    return _Gastos();
  }
}

class _Gastos extends State<Gastos> {
  final List<Gasto> _gastosRegistrados = [
    Gasto(
        title: "Curso Flutter",
        amount: 19.9,
        date: DateTime.now(),
        categoria: Categoria.trabajo),
    Gasto(
        title: "Pelicula",
        amount: 15.9,
        date: DateTime.now(),
        categoria: Categoria.placer),
  ];

  void _addGasto(Gasto gasto) {
    setState(() {
      _gastosRegistrados.add(gasto);
    });
  }

  void _removeGasto(Gasto gasto) {
    final index = _gastosRegistrados.indexOf(gasto);
    setState(() {
      _gastosRegistrados.remove(gasto);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Gasto eliminado"),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: "Deshacer",
        onPressed: () {
          setState(() {
            _gastosRegistrados.insert(index, gasto);
          });
        },
      ),
    ));
  }

  void _abrirAddGastoOverlay() {
    showModalBottomSheet(
      isScrollControlled: MediaQuery.of(context).size.width >= 600,
      context: context,
      builder: (ctx) => NewGasto(onAddGasto: _addGasto),
      //isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("No se encontraron gastos."),
    );
    if (_gastosRegistrados.isNotEmpty) {
      mainContent = ListaGastos(
        gastos: _gastosRegistrados,
        onRemoveGasto: _removeGasto,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Seguimiento de gastos",
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
              onPressed: _abrirAddGastoOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: width < 600
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Grafica(expenses: _gastosRegistrados),
                  Expanded(
                    child: mainContent,
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: Grafica(expenses: _gastosRegistrados)),
                  const SizedBox(width: 60,),
                  Expanded(
                    child: mainContent,
                  ),
                ],
              ),
      ),
    );
  }
}
