import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
final uuid = Uuid();

enum Categoria { comida, viaje, placer, trabajo }

const categoryIcons = {
  Categoria.comida: Icons.lunch_dining,
  Categoria.viaje: Icons.flight_takeoff,
  Categoria.placer: Icons.movie,
  Categoria.trabajo: Icons.work,

};

class Gasto {
  Gasto(
      {required this.title,
      required this.amount,
      required this.date,
      required this.categoria})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Categoria categoria;

  String get fecha
  {
    return formatter.format(date);
  }
}
