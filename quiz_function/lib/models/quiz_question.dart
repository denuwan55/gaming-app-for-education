class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> getShuffledList() {
    final shuffledList = List.of(
        answers); // copy of the list // here final says that we can't reassign to the shuffledList variable, not that we can't change it
    shuffledList.shuffle(); // shuffle in-place
    return shuffledList;
  }
}
