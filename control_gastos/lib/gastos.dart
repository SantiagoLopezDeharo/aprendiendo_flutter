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

  void _abrirAddGastoOverlay()
  {
    showModalBottomSheet(context: context, builder: (ctx) => const NewGasto(),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seguimiento de gastos", textAlign: TextAlign.center,),
        actions: [IconButton(onPressed: _abrirAddGastoOverlay, icon: const Icon(Icons.add))],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Las graficas"),
            Expanded(child: ListaGastos(gastos: _gastosRegistrados)),
          ],
        ),
      ),
    );
  }
}
