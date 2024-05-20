import 'package:shopping_list/modelos/comida_item.dart';
import 'package:shopping_list/modelos/categoria.dart';
import 'package:shopping_list/data/categorias.dart';

final groceryItems = [
  ComidaItem(
      id: 'a',
      name: 'Milk',
      quantity: 1,
      categoria: categorias[Categorias.dairy]!),
  ComidaItem(
      id: 'b',
      name: 'Bananas',
      quantity: 5,
      categoria: categorias[Categorias.fruit]!),
  ComidaItem(
      id: 'c',
      name: 'Beef Steak',
      quantity: 1,
      categoria: categorias[Categorias.meat]!),
];