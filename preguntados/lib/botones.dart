import "package:flutter/material.dart";

class Boton extends StatelessWidget {
  Boton(this.texto, this.onTap, {super.key});
  final String texto;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 50, 57, 133)),
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ));
  }
}
