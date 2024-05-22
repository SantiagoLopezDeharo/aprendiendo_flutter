import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lugares_favoritos/providers/lugares_usuario.dart';
import 'package:lugares_favoritos/widgets/image_input.dart';

class AgregarLugarScreen extends ConsumerStatefulWidget {
  const AgregarLugarScreen({super.key});

  @override
  ConsumerState<AgregarLugarScreen> createState() {
    return _AgregarLugarState();
  }
}

class _AgregarLugarState extends ConsumerState<AgregarLugarScreen> {
  final _tituloController = TextEditingController();

  void _guardarLugar()
  {
    final texto = _tituloController.text;
    if (texto.isEmpty)
      return;
    ref.read(LugaresUsuarioProvider.notifier).agregarLugar(texto);
    Navigator.of(context).pop();

  }

  @override
  void dispose() {
    _tituloController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar nuevo lugar"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Titulo"),
              controller: _tituloController,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 16,
            ),
            const ImageInput(),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
                onPressed: _guardarLugar,
                label: const Text("Agregar lugar"),
                icon: const Icon(Icons.add),
                ),
          ],
        ),
      ),
    );
  }
}
