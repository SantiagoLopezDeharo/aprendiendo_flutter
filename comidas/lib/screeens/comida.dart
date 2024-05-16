import 'package:comidas/modelos/comida.dart';
import 'package:flutter/material.dart';

class ComidaScreen extends StatelessWidget {
  const ComidaScreen({super.key, required this.comida});
  final Comida comida;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          comida.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 21,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              comida.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            for (final ingrediente in comida.ingredients)
              Text(
                ingrediente,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              const SizedBox(
              height: 24,
            ),
        
            Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            for (final step in comida.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
        
          ],
        ),
      ),
    );
  }
}
