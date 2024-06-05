import 'package:control_gastos/grafica.dart';
import 'package:control_gastos/new_gasto.dart';
import 'package:control_gastos/providers/gastos_usuario.dart';
import 'package:flutter/material.dart';
import 'package:control_gastos/modelos/gasto.dart';
import 'package:control_gastos/lista_gastos.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Gastos extends ConsumerStatefulWidget {
  @override
  ConsumerState<Gastos> createState() {
    return _Gastos();
  }
}

class _Gastos extends ConsumerState<Gastos> {
  late Future<void> _gastosFuture;

  @override
  void initState() {
    super.initState();
    _gastosFuture = ref.read(GastosUsuarioProvider.notifier).loadData();
  }

  void _addGasto(Gasto gasto) {
    ref.read(GastosUsuarioProvider.notifier).agregarGasto(gasto.id, gasto.title, gasto.amount, gasto.date, gasto.categoria);
  }

  void _removeGasto(Gasto gasto) {
    ref.read(GastosUsuarioProvider.notifier).removerGasto(gasto);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Gasto eliminado"),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: "Deshacer",
        onPressed: () {
          setState(() {
            ref.read(GastosUsuarioProvider.notifier).agregarGasto(gasto.id, gasto.title, gasto.amount, gasto.date, gasto.categoria);
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
    final gastosRegistrados = ref.watch(GastosUsuarioProvider);

    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("No se encontraron gastos."),
    );
    if (gastosRegistrados.isNotEmpty) {
      mainContent = ListaGastos(
        gastos: gastosRegistrados,
        onRemoveGasto: _removeGasto,
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Seguimiento de gastos",
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
              onPressed: _abrirAddGastoOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: _gastosFuture,
        builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting ? const Center(child: CircularProgressIndicator(),):
        Center(
          child: width < 600
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Grafica(expenses: gastosRegistrados),
                    Expanded(
                      child: mainContent,
                    ),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: Grafica(expenses: gastosRegistrados)),
                    const SizedBox(width: 60,),
                    Expanded(
                      child: mainContent,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
