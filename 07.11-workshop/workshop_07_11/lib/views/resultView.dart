import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  final int rightAnswer;
  final List<bool> isCorrect;

  ResultView({super.key, required this.rightAnswer, required this.isCorrect});

  @override
  Widget build(BuildContext context) {
    print(isCorrect);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz App",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: ListView.builder(
          itemCount: isCorrect.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Center(
                child: Text(
                  "$rightAnswer/10 yaptın.",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
              );
            }
            return ListTile(
              title: Text(
                '${index}. Soruyu ${isCorrect[index - 1] ? "Doğru" : "Yanlış"} Cevapladın.',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
            );
          },
        ),
      ),
    );
  }
}
