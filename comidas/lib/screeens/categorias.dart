import 'package:comidas/modelos/categoria.dart';
import 'package:comidas/modelos/comida.dart';
import 'package:comidas/screeens/comidas.dart';
import 'package:comidas/widgets/categoria_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:comidas/Data/dummy_data.dart';

class CategoriasScreen extends StatefulWidget {
  const CategoriasScreen({super.key, required this.comidas});
  final List<Comida> comidas;

  @override
  State<CategoriasScreen> createState() => _CategoriasScreenState();
}

class _CategoriasScreenState extends State<CategoriasScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _seleccionarCategoria(BuildContext context, Categoria categoria) {
    final comidasF = widget.comidas
        .where((element) => element.categorias.contains(categoria.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => ComidasScreen(
          title: categoria.title,
          comidas: comidasF,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Elige la categoria"),
        ),
        body: GridView(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for (final i in availableCategorias)
              CategoriaGridItem(
                categoria: i,
                onSeleccion: () => {_seleccionarCategoria(context, i)},
              )
          ],
        ),
      ),
      builder: (ctx, child) => SlideTransition(
        position: _animationController.drive(
          Tween(
            begin: const Offset(0, 0.2),
            end: const Offset(0, 0),
          ),
        ),
        child: child,
      ),
    );
  }
}

class Comidas {}
