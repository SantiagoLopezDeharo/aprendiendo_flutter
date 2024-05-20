import 'package:flutter/material.dart';

enum Categorias {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other
}

class Categoria {
  const Categoria(this.titulo, this.color);

  final String titulo;
  final Color color;
}