import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Features/Quiz/models/quiz_question.dart';
import 'package:quiz_app/Features/Quiz/widgets/answer_button.dart';
import 'package:quiz_app/Levels/Level1/Data/feature_data.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    final QuizQuestion currentQuestion = featureData["1"] as QuizQuestion;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  if (answer == (featureData["1"] as QuizQuestion).answers[0]) {
                    widget.onSelectAnswer("success-screen");
                  } else {
                    widget.onSelectAnswer("failure-screen");
                  }
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
