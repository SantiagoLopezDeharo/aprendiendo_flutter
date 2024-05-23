import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lugares_favoritos/pantallas/agregar_lugar.dart';
import 'package:lugares_favoritos/providers/lugares_usuario.dart';
import 'package:lugares_favoritos/widgets/listado.dart';

class LugaresListaScreen extends ConsumerStatefulWidget {
  const LugaresListaScreen({super.key});

  @override
  ConsumerState<LugaresListaScreen> createState() => _LugaresListaScreenState();
}

class _LugaresListaScreenState extends ConsumerState<LugaresListaScreen> {
  late Future<void> _lugarFuture;

  @override
  void initState() {
    super.initState();
    _lugarFuture = ref.read(LugaresUsuarioProvider.notifier).loadData();
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: _lugarFuture,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : Listado(lugares: lugares),
      ),
    );
  }
}
