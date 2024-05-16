enum Complejidad {
  simple,
  mediana,
  dificil,
}

enum Precio {
  barato,
  caro,
  lujoso,
}

class Comida {
  const Comida({
    required this.id,
    required this.categorias,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complejidad,
    required this.precio,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  final String id;
  final List<String> categorias;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complejidad complejidad;
  final Precio precio;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
}