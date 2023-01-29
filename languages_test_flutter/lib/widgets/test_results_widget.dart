import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languages_test_client/languages_test_client.dart';

class TestResultsWidget extends StatelessWidget {
  const TestResultsWidget({super.key, required this.test});

  final Test test;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/${test.language!.code}'),
        ),
        title: const Text(
          'Test Results',
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const Padding(padding: EdgeInsets.all(10.0)),
          Text(
            "Score: ${test.result!}%",
            style: const TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const Padding(padding: EdgeInsets.all(3.0)),
          Text(
            "Correct answers: ${_getNumOfCorrectAnswers()} out of ${test.words!.length}",
            style: const TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const Padding(padding: EdgeInsets.all(10.0)),
          ...test.words!.map((word) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Center(
                  child: SizedBox(
                    width: 300,
                    child: Card(
                      color:
                          word.correct! ? Colors.green[200] : Colors.red[200],
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Word: ${word.askingWord}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Padding(padding: EdgeInsets.all(3.0)),
                            Text(
                              "Correct answer: ${word.correctChoice}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const Padding(padding: EdgeInsets.all(3.0)),
                            Text(
                              "Your answer: ${word.answer}",
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
              )),
        ],
      ),
    );
  }

  int _getNumOfCorrectAnswers() {
    return test.words!
        .map((word) => word.correct != null && word.correct! ? 1 : 0)
        .reduce((value, element) => value + element);
  }
}
