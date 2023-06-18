import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Widgets/DragAndDrop/draggable_target.dart';
import 'package:quiz_app/Widgets/DragAndDrop/draggable_widget.dart';
import 'package:quiz_app/Widgets/Quiz/models/quiz_question.dart';
import 'package:quiz_app/Widgets/Quiz/widgets/answer_button.dart';
import 'package:quiz_app/Levels/Level2/Data/feature_data.dart';

class DragAndDropScreen extends StatefulWidget {
  const DragAndDropScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<DragAndDropScreen> createState() {
    return _DragAndDropScreenState();
  }
}

class _DragAndDropScreenState extends State<DragAndDropScreen> {
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
            DragTargetWidget(
              onAccept: (data) {
                if (data ==
                    (featureData["drag-drop-screen"] as QuizQuestion)
                        .answers[0]) {
                  widget.onSelectAnswer("success-screen");
                } else {
                  widget.onSelectAnswer("failure-screen");
                }
              },
              onWillAccept: (data) {
                // logic to accept the dragged-in item
                return true; // should return a bool
              },
              child: Text(
                currentQuestion.text,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 201, 153, 251),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return DraggableWidget(
                data: answer,
                child: AnswerButton(
                  answerText: answer,
                  onTap: () {},
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
