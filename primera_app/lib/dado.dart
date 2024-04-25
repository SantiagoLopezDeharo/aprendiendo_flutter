import 'package:flutter/material.dart';
import 'package:primera_app/hola.dart';
import "dart:math";

final randomizador = Random();

class Dado extends StatefulWidget
{
  const Dado({super.key});
  @override
  State<Dado> createState() 
  {
    return _DadoState();
  }
}

class _DadoState extends State<Dado> 
{
  var activeDiceImage = "assets/images/dice-1.png";
  void dados()
  {
    var cara = randomizador.nextInt(6) + 1;
    setState(() {
      activeDiceImage = "assets/images/dice-$cara.png";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(activeDiceImage,
                width: 100,
              ),
                TextButton(
                  onPressed: dados,
                  style: TextButton.styleFrom(
                    maximumSize: const Size(200, 40),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.red,
                  ),
                
                child: const Hola("Tirar el dado!"),
                ),
            ]);
  }
}