import "package:flutter/material.dart";

class Boton extends StatelessWidget {
  const Boton(this.texto, this.onTap, {super.key});
  final String texto;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return
        ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 50, 57, 133),
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 40,
              ),
            ),
            child: Text(
              texto,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ));

  }
}
