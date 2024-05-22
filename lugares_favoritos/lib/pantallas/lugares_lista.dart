import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lugares_favoritos/pantallas/agregar_lugar.dart';
import 'package:lugares_favoritos/providers/lugares_usuario.dart';
import 'package:lugares_favoritos/widgets/listado.dart';

class LugaresListaScreen extends ConsumerWidget {
  const LugaresListaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lugares = ref.watch(LugaresUsuarioProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tus lugares"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => const AgregarLugarScreen()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Listado(
        lugares: lugares,
      ),
    );
  }
}
