import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/widgets/Nuevo_item.dart';

class ComidaLista extends StatefulWidget {
  const ComidaLista({super.key});

  @override
  State<ComidaLista> createState() => _ComidaListaState();
}

class _ComidaListaState extends State<ComidaLista> {
  final _list = [];
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
                final ni = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const NuevoItem()));
                if (ni == null) return;
                setState(() {
                  _list.add(ni);
                });
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: content,
    );
  }
}
