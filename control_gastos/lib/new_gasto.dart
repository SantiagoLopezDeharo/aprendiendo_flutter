import 'package:flutter/material.dart';
import 'package:control_gastos/modelos/gasto.dart';

class NewGasto extends StatefulWidget {
  const NewGasto({super.key});

  @override
  State<NewGasto> createState() {
    return _NewGastoState();
  }
}

class _NewGastoState extends State<NewGasto> {
  final _controladorTitulo = TextEditingController();
  final _controladorCant = TextEditingController();
  DateTime? _newfecha = DateTime.now();
  Categoria _newCategoria = Categoria.comida;

  @override
  void dispose() {
    _controladorTitulo.dispose();
    _controladorCant.dispose();
    super.dispose();
  }

  void _mostrarCalendario() async {
    final now = DateTime.now();
    final newFecha = await showDatePicker(
        context: context,
        firstDate: DateTime(now.year, now.month, 1),
        lastDate: now);
    if (newFecha != null){
      setState(() {
        _newfecha = newFecha;
      });}
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _controladorTitulo,
            maxLength: 30,
            decoration: const InputDecoration(
              label: Text("Titulo"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controladorCant,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: "UY\$",
                    label: Text("cantidad"),
                  ),
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(formatter.format(_newfecha!)),
                  IconButton(
                      onPressed: _mostrarCalendario,
                      icon: const Icon(Icons.calendar_month)),
                ],
              ))
            ],
          ),
          const SizedBox(height: 18,),
          Row(
            children: [
              DropdownButton(
                value: _newCategoria,
                items: Categoria.values.map((c) => DropdownMenuItem(value:c , child: Text(c.name.toUpperCase()))).toList(), 
                onChanged: (value) {
                  if(value != null){
                  setState(() {
                    _newCategoria = value!;
                  });}
                }),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancelar")),
              ElevatedButton(
                  onPressed: () {
                    print(
                        "${_controladorTitulo.text} : ${_controladorCant.text}");
                  },
                  child: const Text("Guardar gasto")),
            ],
          )
        ],
      ),
    );
  }
}
