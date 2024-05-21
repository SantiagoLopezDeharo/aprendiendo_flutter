import 'package:flutter/material.dart';
import 'package:shopping_list/data/categorias.dart';
import 'package:shopping_list/modelos/comida_item.dart';
import 'package:shopping_list/widgets/Nuevo_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ComidaLista extends StatefulWidget {
  const ComidaLista({super.key});

  @override
  State<ComidaLista> createState() => _ComidaListaState();
}

class _ComidaListaState extends State<ComidaLista> {
  final url = Uri.https("shoppinglist-3abe6-default-rtdb.firebaseio.com",
          "shopping-list.json");
  List<ComidaItem> _list = [];
  
  void eliminarItem(ComidaItem it)
  {
    final url = Uri.https("shoppinglist-3abe6-default-rtdb.firebaseio.com",
          "shopping-list/${it.id}.json");
    http.delete(url);
  }

  void _cargarItems() async
  {
    final response = await http.get(url);
    final Map<String, dynamic> Lista = json.decode(response.body);
    final List<ComidaItem> _list2 = [];
    for (final it in Lista.entries)
    {
      final cat = categorias.entries.firstWhere((cit) => cit.value.titulo == it.value["categoria"]).value;
      _list2.add(ComidaItem(
        id: it.key, 
        name: it.value["name"], 
        quantity: it.value["quantity"], 
        categoria: cat));
    }

    setState(() {
      _list = _list2;
    });
  }
  
  @override
  void initState() {
    super.initState();
    _cargarItems();

  }
  
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("No hay ningun item todavia"),
    );
    if (_list.isNotEmpty)
      content = ListView.builder(
        itemCount: _list.length,
        itemBuilder: (ctx, indx) => Dismissible(
          onDismissed: (direction) {
            setState(() {
              _list.remove(_list[indx]);
              eliminarItem(_list[indx]);
            });
          },
          key: ValueKey(_list[indx].id),
          child: ListTile(
            title: Text(_list[indx].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _list[indx].categoria.color,
            ),
            trailing: Text(_list[indx].quantity.toString()),
          ),
        ),
      );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista para el super"),
        actions: [
          IconButton(
              onPressed: () async {
                await Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const NuevoItem()));
                    _cargarItems();
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: content,
    );
  }
}
