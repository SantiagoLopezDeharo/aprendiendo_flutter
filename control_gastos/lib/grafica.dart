import 'package:control_gastos/bara_grafica.dart';
import 'package:control_gastos/modelos/gasto.dart';
import 'package:flutter/material.dart';

class Grafica extends StatelessWidget {
  const Grafica({super.key, required this.expenses});

  final List<Gasto> expenses;

  List<BaldeGasto> get buckets {
    return [
      BaldeGasto.forCategoria(expenses, Categoria.comida),
      BaldeGasto.forCategoria(expenses, Categoria.placer),
      BaldeGasto.forCategoria(expenses, Categoria.viaje),
      BaldeGasto.forCategoria(expenses, Categoria.trabajo),
    ];
  }

  double get total {
    double t = 0;
    for (var i in buckets) t += i.gastosTotales;
    return t;
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.gastosTotales > maxTotalExpense) {
        maxTotalExpense = bucket.gastosTotales;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()
                  BaraGrafica(
                    fill: bucket.gastosTotales == 0
                        ? 0
                        : bucket.gastosTotales / maxTotalExpense,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        children: [
                          Icon(
                            categoryIcons[bucket.categoria],
                            color: isDarkMode
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.7),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text((bucket.gastosTotales * 100 / total)
                              .toStringAsFixed(1) + "%"),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
