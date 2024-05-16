import 'package:comidas/modelos/comida.dart';
import 'package:comidas/widgets/comida_item.dart';
import 'package:flutter/material.dart';

class ComidasScreen extends StatelessWidget {
  const ComidasScreen({super.key, required this.title, required this.comidas, required this.onFav});
  final String title;
  final List<Comida> comidas;
  final void Function(Comida comida) onFav;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: comidas.length,
        itemBuilder: (ctx, indx) => ComidaItem(comida: comidas[indx], onFav: onFav,));

    if (comidas.isEmpty) {
      content = Container(
        padding: const EdgeInsets.all(26),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  textAlign: TextAlign.center,
                  "Parece que no hay comidas en esta seccion .....",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Intenta ver otra categoria!",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              )
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
