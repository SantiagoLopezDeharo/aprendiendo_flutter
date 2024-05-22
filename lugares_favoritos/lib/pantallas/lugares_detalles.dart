import 'package:flutter/material.dart';
import 'package:lugares_favoritos/modelos/lugar.dart';

class LugaresDetallesScreen extends StatelessWidget {
  const LugaresDetallesScreen({super.key, required this.lugar});
  final Lugar lugar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lugar.title),
      ),
      body: Center(
        child: Text(
          lugar.title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
