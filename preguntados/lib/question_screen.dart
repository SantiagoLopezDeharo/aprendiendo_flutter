import "package:flutter/material.dart";
import "package:preguntados/botones.dart";
import "data/questions.dart";

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    final preguntaActual = questions[i];

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            preguntaActual.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ...preguntaActual.getRespRand().map((resp) {
            return Boton(resp, () {});
          }),
        ],
      ),
    );
  }
}
