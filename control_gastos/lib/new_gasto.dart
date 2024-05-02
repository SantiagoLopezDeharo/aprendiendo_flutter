import 'package:flutter/material.dart';

class NewGasto extends StatefulWidget
{
  const NewGasto({super.key});

  @override
  State<NewGasto> createState() {
    return _NewGastoState();
  }
}

class _NewGastoState extends State<NewGasto>
{
  String newTitulo = "";
  void _saveTitulo(String titulo)
  {
    newTitulo = titulo;
  }
  @override
  Widget build(BuildContext context) 
  {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          onChanged: _saveTitulo,
          maxLength: 30,
          decoration: const InputDecoration(
            label: Text("Titulo"),
          ),
        ),
        Row(
          children: [
            ElevatedButton(onPressed: () {print(newTitulo);}, child: const Text("Guardar gasto")),
          ],
        )
      ],),
    );
  }
}