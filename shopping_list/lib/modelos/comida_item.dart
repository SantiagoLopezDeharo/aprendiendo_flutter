
import 'package:shopping_list/modelos/categoria.dart';

class ComidaItem
{
  const ComidaItem({required this.id, required this.name, required this.quantity, required this.categoria});

  final String id;
  final String name;
  final int quantity;
  final Categoria categoria;
}