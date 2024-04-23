import 'package:flutter/material.dart';
import 'package:primera_app/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GradientContainer([
                const Color.fromARGB(111, 158, 206, 227), 
                const Color.fromARGB(108, 185, 64, 64),
                const Color.fromARGB(108, 4, 16, 48)],),
      ),
    ),
  );
}