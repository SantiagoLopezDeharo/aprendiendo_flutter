import 'package:flutter/material.dart';

import 'package:shopping_list/modelos/categoria.dart';

const categorias = {
  Categorias.vegetables: Categoria(
    'Vegetables',
    Color.fromARGB(255, 0, 255, 128),
  ),
  Categorias.fruit: Categoria(
    'Fruit',
    Color.fromARGB(255, 145, 255, 0),
  ),
  Categorias.meat: Categoria(
    'Meat',
    Color.fromARGB(255, 255, 102, 0),
  ),
  Categorias.dairy: Categoria(
    'Dairy',
    Color.fromARGB(255, 0, 208, 255),
  ),
  Categorias.carbs: Categoria(
    'Carbs',
    Color.fromARGB(255, 0, 60, 255),
  ),
  Categorias.sweets: Categoria(
    'Sweets',
    Color.fromARGB(255, 255, 149, 0),
  ),
  Categorias.spices: Categoria(
    'Spices',
    Color.fromARGB(255, 255, 187, 0),
  ),
  Categorias.convenience: Categoria(
    'Convenience',
    Color.fromARGB(255, 191, 0, 255),
  ),
  Categorias.hygiene: Categoria(
    'Hygiene',
    Color.fromARGB(255, 149, 0, 255),
  ),
  Categorias.other: Categoria(
    'Other',
    Color.fromARGB(255, 0, 225, 255),
  ),
};