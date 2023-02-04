import 'package:flutter/material.dart';
import 'package:languages_test_client/languages_test_client.dart';

class ResultWordWidget extends StatelessWidget {
  const ResultWordWidget({super.key, required this.testWord});

  final TestWord testWord;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Center(
        child: SizedBox(
          width: 300,
          child: Card(
            color: testWord.correct! ? Colors.green[200] : Colors.red[200],
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Word: ${testWord.askingWord}",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.all(3.0)),
                  Text(
                    "Correct answer: ${testWord.correctChoice}",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.all(3.0)),
                  Text(
                    "Your answer: ${testWord.answer}",
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
