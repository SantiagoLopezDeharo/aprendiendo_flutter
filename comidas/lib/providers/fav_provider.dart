import "package:comidas/modelos/comida.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class favNotifier extends StateNotifier<List<Comida>>
{
  favNotifier() : super([]);

  void toggleComidaFavStatus(Comida comida)
  {
    if (state.contains(comida))
    {
      state = state.where((c) => c.id != comida.id ).toList();
    }
    else
    {
      state = [...state, comida];
    }
  }
}

final favProvider = StateNotifierProvider<favNotifier, List<Comida>>(
  (ref)
  {
    return favNotifier();
  }
);