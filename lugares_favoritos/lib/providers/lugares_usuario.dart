import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lugares_favoritos/modelos/lugar.dart';

class LugaresUsuarioNotifier extends StateNotifier<List<Lugar>> {
  LugaresUsuarioNotifier() : super(const []);

  void agregarLugar(String title) {
    final nuevo = Lugar(title: title);
    state = [nuevo, ...state];
  }
}

final LugaresUsuarioProvider = StateNotifierProvider<LugaresUsuarioNotifier, List<Lugar>>(
  (ref) => LugaresUsuarioNotifier(),
);
