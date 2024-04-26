import "package:flutter/material.dart";
import "package:preguntados/question_screen.dart";
import "package:preguntados/start.dart";

class Quiz extends StatefulWidget
{
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>
{
  Widget? activeScreen;

@override
  void initState() {
    activeScreen = Start(cambiarPantalla);
    super.initState();
  }

  void cambiarPantalla()
  {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      body: Center(child: activeScreen),
      backgroundColor: const Color.fromARGB(255, 46, 24, 100),
    ),
  );
  }
}