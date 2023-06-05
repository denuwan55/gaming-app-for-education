import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onSelectRestart
  });
  final List<String> chosenAnswers;
  final void Function() onSelectRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question-index': i,
        'question': questions[i].question,
        'correct-answer': questions[i].answers[0],
        'user-answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctQuestions = summaryData.where((data) {
      return data['correct-answer'] == data['user-answer'];
    }).length;

    return SizedBox(
      width:
          double.infinity, // use as much width as u can / be wide as possible
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $correctQuestions out of $totalQuestions!'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: onSelectRestart,
              child: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
