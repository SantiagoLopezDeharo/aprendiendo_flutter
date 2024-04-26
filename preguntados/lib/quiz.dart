import "package:flutter/material.dart";
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      body: Center(child: Start()),
      backgroundColor: Color.fromARGB(255, 46, 24, 100),
    ),
  );
  }
}