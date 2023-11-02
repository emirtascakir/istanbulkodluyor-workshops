import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  final int rightAnswer;

  ResultView({super.key, required this.rightAnswer});

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
      body: Center(
        child: Text(
          "$rightAnswer/10 yaptın.",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
