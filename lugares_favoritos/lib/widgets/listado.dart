import 'package:flutter/material.dart';
import 'package:lugares_favoritos/modelos/lugar.dart';
import 'package:lugares_favoritos/pantallas/lugares_detalles.dart';

class Listado extends StatelessWidget {
  const Listado({super.key, required this.lugares});
  final List<Lugar> lugares;

  @override
  Widget build(BuildContext context) {
    if (lugares.isEmpty)
      return Center(
        child: Text(
          "No hay lugares agregados",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );

    return ListView.builder(
        itemCount: lugares.length,
        itemBuilder: (ctx, indx) => ListTile(
              onTap: ()
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => LugaresDetallesScreen(lugar: lugares[indx])));
              },
              title: Text(
                lugares[indx].title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ));
  }
}
