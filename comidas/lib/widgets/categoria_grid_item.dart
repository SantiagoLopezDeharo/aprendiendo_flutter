import 'package:comidas/modelos/categoria.dart';
import 'package:flutter/material.dart';

class CategoriaGridItem extends StatelessWidget {
  const CategoriaGridItem({super.key, required this.categoria, required this.onSeleccion});

  final Categoria categoria;
  final void Function() onSeleccion;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSeleccion,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(21),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            gradient: LinearGradient(
          colors: [
            categoria.color.withOpacity(0.55),
            categoria.color.withOpacity(0.9)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Text(
          categoria.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
