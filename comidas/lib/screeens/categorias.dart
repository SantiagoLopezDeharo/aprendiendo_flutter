import 'package:comidas/modelos/categoria.dart';
import 'package:comidas/screeens/comidas.dart';
import 'package:comidas/widgets/categoria_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:comidas/Data/dummy_data.dart';

class CategoriasScreen extends StatelessWidget {
  const CategoriasScreen({super.key});

  void _seleccionarCategoria(BuildContext context, Categoria categoria) {
    
    final comidasF = dummyComidas.where((element) => element.categorias.contains(categoria.id)).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => ComidasScreen(title: categoria.title, comidas: comidasF),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Elige la categoria"),
        ),
        body: GridView(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            for (final i in availableCategorias)
              CategoriaGridItem(
                categoria: i,
                onSeleccion: () => {_seleccionarCategoria(context, i)},
              )
          ],
        ));
  }
}
