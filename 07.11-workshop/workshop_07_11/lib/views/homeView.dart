import 'package:flutter/material.dart';
import 'package:workshop_07_11/views/quizView.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Quiz App",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/quiz.jpg"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuizView()));
              },
              child: Text("Oyuna Başla", style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
            )
          ],
        ),
      ),
    );
  }
}
