import "package:flutter/material.dart";
import "package:preguntados/botones.dart";
import "package:preguntados/quiz.dart";
import "package:preguntados/resultados.dart";
import "data/questions.dart";
import "package:google_fonts/google_fonts.dart";

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int i = 0;
  bool r = false;
  final List<bool> correctos = [];

  void contestar(String ans)
  {
    setState(() 
    {
      correctos.add(ans == questions[i].answers[0]);
      i++;
      //print(correctos);
    });
  }

  void restart()
  {
    setState(() {
      r = true;
      i = 0;
    });
    
  }

  @override
  Widget build(BuildContext context) {

    if (i >= questions.length)
      return Resultados(correctos, restart);
    if (r)
      return Quiz();
    final preguntaActual = questions[i];

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            preguntaActual.text,
            style: GoogleFonts.tiltPrism(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          ...preguntaActual.getRespRand().map((resp) {
            return Boton(resp, () {contestar(resp);});
          }),
        ],
      ),
    );
  }
}
