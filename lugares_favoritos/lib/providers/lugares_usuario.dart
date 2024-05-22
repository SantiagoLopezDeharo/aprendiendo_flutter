import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lugares_favoritos/modelos/lugar.dart';

class LugaresUsuarioNotifier extends StateNotifier<List<Lugar>> {
  LugaresUsuarioNotifier() : super(const []);

  void agregarLugar(String title, File imagen, LugarUbicacion ubi) {
    final nuevo = Lugar(title: title, imagen:imagen, ubicacion: ubi);
    state = [nuevo, ...state];
  }
}

final LugaresUsuarioProvider = StateNotifierProvider<LugaresUsuarioNotifier, List<Lugar>>
(
  (ref) => LugaresUsuarioNotifier(),
);
