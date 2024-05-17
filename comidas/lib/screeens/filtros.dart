import 'package:comidas/modelos/comida.dart';
import 'package:flutter/material.dart';


class FiltrosScreen extends StatefulWidget {
  const FiltrosScreen({super.key, required this.valores});
  final Map<Filtros, bool> valores;
  @override
  State<StatefulWidget> createState() {
    return _FiltrsoScreenBuilder();
  }
}

class _FiltrsoScreenBuilder extends State<FiltrosScreen>
{


  void _updateState(bool value, Filtros f)
  {
    setState(() {
      widget.valores[f] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if(didPop) return;
        Navigator.of(context).pop(widget.valores);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Configuracion de filtros",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [ 
            SwitchListTile(
              title: const Text("Gluten Free", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              value: widget.valores[Filtros.glutenFree]!, 
              onChanged: (value) {_updateState(value, Filtros.glutenFree);}
            ),
            SwitchListTile(
              title: const Text("Lactose Free", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              value: widget.valores[Filtros.lactoseFree]!, 
              onChanged: (value) {_updateState(value, Filtros.lactoseFree);}
            ),
            
            SwitchListTile(
              title: const Text("Vegan", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              value: widget.valores[Filtros.vegan]!, 
              onChanged: (value) {_updateState(value, Filtros.vegan);}
            ),
            
            SwitchListTile(
              title: const Text("Vegetarian", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              value: widget.valores[Filtros.vegetarian]!, 
              onChanged: (value) {_updateState(value, Filtros.vegetarian);}
            ),
        ],),
      ),
    );
  }
}