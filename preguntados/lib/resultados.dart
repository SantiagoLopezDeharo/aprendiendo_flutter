import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:preguntados/data/questions.dart";
import "package:preguntados/resultados_resumen.dart";
import 'package:google_fonts/google_fonts.dart';

class Resultados extends StatelessWidget
{
  Resultados(this.res, this.reload, {super.key});
  final List<bool> res;
  final void Function() reload;
  int resN = 0;
  int l = questions.length;
  List<Map<String, Object>> getData()
  {
    final List<Map<String, Object>> resultado = [];

    for (int i = 0; i < res.length; i++)
    {
      resultado.add({
        "question_index" : i,
        "question" : questions[i].text,
        "correct_answer" : questions[i].answers[0],
        "user_answer" : res[i]
      });
    }

    return resultado;
  }
  
  @override
  Widget build(BuildContext context) {
    for(int i = 0; i < res.length; i++) if (res[i]) resN++;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              textAlign: TextAlign.center,
              "You answered $resN / $l answers !",
              style: GoogleFonts.aldrich(
                fontSize: 24, color: Color.fromARGB(255, 214, 214, 215)),
              ),
            const SizedBox(height: 30,),
            ResultadoResumen(getData()),
            const SizedBox(height: 30,),
            OutlinedButton(
              onPressed: () {reload();},
              child: const Text(
                "Restart Quiz!",
                style: TextStyle(
                fontSize: 15, color: Color.fromARGB(196, 171, 169, 177)),
                  ),
                )
          ],
        ),
      ),
    );
  }
}