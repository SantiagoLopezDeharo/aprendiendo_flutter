import 'package:control_gastos/gasto_item.dart';
import 'package:flutter/material.dart';
import 'package:control_gastos/modelos/gasto.dart';

class ListaGastos extends StatelessWidget {
  const ListaGastos(
      {super.key, required this.gastos, required this.onRemoveGasto});
  final void Function(Gasto gasto) onRemoveGasto;
  final List<Gasto> gastos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gastos.length,
      itemBuilder: (ctx, indx) => Dismissible(
        onDismissed: (dir) {
          onRemoveGasto(gastos[indx]);
        },
        key: ValueKey(gastos[indx]),
        child: GastoItem(gastos[indx]),
      ),
    );
  }
}
