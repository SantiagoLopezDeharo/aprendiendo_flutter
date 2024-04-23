import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color.fromARGB(111, 158, 206, 227), 
                Color.fromARGB(108, 185, 64, 64),
                Color.fromARGB(108, 4, 16, 48)],
              )
          ),
          child: const Center(
            child: Text("Hola :)"),
          ),
        ),
      ),
    ),
  );
}
