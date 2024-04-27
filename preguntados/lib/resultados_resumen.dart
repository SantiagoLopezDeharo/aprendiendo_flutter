import 'dart:ffi';

import 'package:flutter/material.dart';

class ResultadoResumen extends StatelessWidget {
  const ResultadoResumen(this.data, {super.key});

  final List<Map<String, Object>> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
          children: data.map((dato) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: (dato["user_answer"] as bool) ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(100)
                     ),
                    child: Text(
                      ((dato["question_index"] as int) + 1).toString(),
                      style: const TextStyle(
                        fontSize: 33,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
        
                Expanded(
                  child: Column(
                    children: [
                      Text( dato["question"] as String,
                      style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ), ),
                      const SizedBox(height: 5,),
                      Text( "Correct answer: " + (dato["correct_answer"] as String),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 225, 107, 184),
                    ), ),
                      const SizedBox(height: 5,),
                      Text( (dato["user_answer"] as bool) ? "CORRECT !" : "WRONG !",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: (dato["user_answer"] as bool) ?Colors.green : Colors.red,
                    ), ),
                      const SizedBox(height: 5,),
                      ]
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
