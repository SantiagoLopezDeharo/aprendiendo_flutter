import 'package:flutter/material.dart';
import "package:control_gastos/modelos/gasto.dart";

class GastoItem extends StatelessWidget
{
  const GastoItem (this.gasto, {super.key});
  
  final Gasto gasto;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 15),
        child: Column(
          children: [
            Text(gasto.title),
            const SizedBox(height: 6,),
            Row(
              children: [
                Text("\$${gasto.amount.toStringAsFixed(2)}"),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[gasto.categoria]),
                    const SizedBox(width: 8,),
                    Text(gasto.fecha),
                  ],
                ),

              ],
            )
          ],
          ),
      ),
    );
  }

}