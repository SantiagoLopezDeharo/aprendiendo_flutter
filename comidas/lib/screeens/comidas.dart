import 'package:comidas/modelos/comida.dart';
import 'package:flutter/material.dart';

class ComidasScreen extends StatelessWidget {
  const ComidasScreen({super.key, required this.title, required this.comidas});
  final String title;
  final List<Comida> comidas;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: comidas.length,
        itemBuilder: (ctx, indx) => Text(comidas[indx].title, style: const TextStyle(color: Colors.white),));

    if (comidas.isEmpty) {
      content = Container(
        padding: const EdgeInsets.all(26),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Parece que no hay comidas en esta seccion .....",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground)),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Intenta ver otra categoria!",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
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
