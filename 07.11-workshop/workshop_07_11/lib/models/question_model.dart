class QuestionModel {
  QuestionModel(
      this.question, this.answers, this.correctAnswer, this.answeredCorrect);

  final String question;
  final List<String> answers;
  final String correctAnswer;
  late final bool answeredCorrect;
}
