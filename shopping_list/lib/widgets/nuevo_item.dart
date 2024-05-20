import 'package:flutter/material.dart';
import 'package:shopping_list/data/categorias.dart';
import 'package:shopping_list/modelos/categoria.dart';
import 'package:shopping_list/modelos/comida_item.dart';

class NuevoItem extends StatefulWidget {
  const NuevoItem({super.key});

  @override
  State<NuevoItem> createState() {
    return _NuevoItemState();
  }
}

class _NuevoItemState extends State<NuevoItem> {
  final _formKey = GlobalKey<FormState>();

  void _guardarItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(
        ComidaItem(
          id: DateTime.now().toString(),
          name: _nombre,
          quantity: _cantidad,
          categoria: _categoria,
        ),
      );
    }
  }

  String _nombre = "";
  int _cantidad = 0;
  var _categoria = categorias[Categorias.vegetables]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onSaved: (v) {
                  _nombre = v!;
                },
                maxLength: 50,
                decoration: const InputDecoration(label: Text("Nombre")),
                validator: (s) {
                  if (s == null ||
                      s.isEmpty ||
                      s.trim().length <= 1 ||
                      s.trim().length >= 50) return "Error en el nombre";
                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      onSaved: (v) {
                        _cantidad = int.parse(v!);
                      },
                      validator: (s) {
                        if (s == null ||
                            s.isEmpty ||
                            int.tryParse(s) == null ||
                            int.tryParse(s)! <= 0)
                          return "Error en la cantidad";
                        return null;
                      },
                      decoration: const InputDecoration(
                        label: Text("Quantity"),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: "1",
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _categoria,
                      items: [
                        for (final categoria in categorias.entries)
                          DropdownMenuItem(
                            value: categoria.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: categoria.value.color,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(categoria.value.titulo),
                              ],
                            ),
                          )
                      ],
                      onChanged: (value) {
                        setState(() {
                          _categoria = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 21,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      child: const Text("Resetear")),
                  ElevatedButton(
                      onPressed: _guardarItem,
                      child: const Text("Agregar item")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
