class QuizQuestion {
  const QuizQuestion(
    this.text, 
    this.answers
    );

  final String text;
  final List<String> answers;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers); // .of() method used to create a new copy of the list, as the shuffle() method will physically change the list it is applied to.
    shuffledList.shuffle(); // shuffle returns northing (void), therefore we need to first assign the list copy to a variable, and then shuffle afterwards
    return shuffledList;
  }
}