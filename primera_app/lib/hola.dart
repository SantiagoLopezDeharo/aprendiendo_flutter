import 'package:flutter/material.dart';

class Hola extends StatelessWidget
{
  const Hola(this.text, {super.key});
  final String text; 
  @override
  Widget build(BuildContext context) {
    return Center(
            child: Text(
              text, 
              style: const TextStyle(
                color: Colors.black,
                fontSize: 21,
              ),
              ),
          );
    
  }
}