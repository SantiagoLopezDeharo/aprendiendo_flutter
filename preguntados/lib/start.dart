import "package:flutter/material.dart";

class Start extends StatelessWidget 
{
  const Start(this.preguntar, {super.key});
  
  final void Function() preguntar;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/images/quiz-logo.png", width: 300),
        const SizedBox(
          height: 40,
        ),
        const Text(
          "Learn Flutter the fun way !",
          style: TextStyle(
              fontSize: 24, color: Color.fromARGB(196, 171, 169, 177)),
        ),
        const SizedBox(
          height: 66,
        ),
        OutlinedButton(
          onPressed: () {preguntar();},
          child: const Text(
            "Start Quiz",
            style: TextStyle(
                fontSize: 15, color: Color.fromARGB(196, 171, 169, 177)),
          ),
        ),
      ],
    );
  }
}
