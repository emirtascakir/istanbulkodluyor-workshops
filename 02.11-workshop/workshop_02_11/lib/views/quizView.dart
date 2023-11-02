import 'package:flutter/material.dart';
import 'package:workshop_02_11/data/questions.dart';
import 'package:workshop_02_11/models/question_model.dart';
import 'package:workshop_02_11/views/resultView.dart';

class QuizView extends StatefulWidget {
  const QuizView({Key? key}) : super(key: key);

  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  int rightAnswer = 0;
  int index = 0;

  void checkAnswer(String selectedAnswer) {
    QuestionModel currentQuestion = questions[index];

    if (currentQuestion.correctAnswer == selectedAnswer) {
      setState(() {
        rightAnswer++;
      });
    }

    if (index < questions.length - 1) {
      setState(() {
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz App",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              questions[index].question,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...questions[index].answers.map((answer) {
              return ElevatedButton(
                onPressed: () {
                  checkAnswer(answer);
                  print(rightAnswer);
                },
                child: Text(
                  answer,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              );
            }),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ResultView(rightAnswer: rightAnswer)));
                },
                child: Text("Sonuçları Gör",
                    style: TextStyle(fontSize: 20, color: Colors.blue)))
          ],
        ),
      ),
    );
  }
}
