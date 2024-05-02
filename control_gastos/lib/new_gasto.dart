import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  @override
  void dispose() {
    _controladorTitulo.dispose();
    _controladorCant.dispose();
    super.dispose();
  }

  void _mostrarCalendario()
  {
    final now = DateTime.now();
    showDatePicker(context: context, firstDate: DateTime(now.year, now.month, 1), lastDate: now);
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
              Expanded(child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Text("Selected Date"),
                IconButton(onPressed: _mostrarCalendario, icon: const Icon(Icons.calendar_month)),
              ],))
            ],
          ),
          Row(
            children: [
              TextButton(onPressed: () {Navigator.pop(context);}, child: const Text("Cancelar")),
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
