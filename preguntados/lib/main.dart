import "package:flutter/material.dart";

void main()
{
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
              Image.asset("assets/images/quiz-logo.png", width: 300),
              const Text(
                  "Learn Flutter the fun way !",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(0, 219, 219, 219)
                  ),
              ),
              TextButton(
                onPressed: () {} , 
                child: const Text(
                  "Start Quiz",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(0, 219, 219, 219)
                  ),
              ),

                ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 46, 24, 100),
      ),
    )
  );
}

