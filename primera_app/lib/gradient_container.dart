import 'package:flutter/material.dart';
import 'package:primera_app/dado.dart';

class GradientContainer extends StatelessWidget 
{
  GradientContainer(this.colores, {super.key});
  final List<Color> colores;

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: colores
              )
          ),
          child: const Center(
            child: Dado()
            )
        );
  }

}