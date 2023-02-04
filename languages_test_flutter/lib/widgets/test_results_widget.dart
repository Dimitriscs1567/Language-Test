import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languages_test_client/languages_test_client.dart';
import 'package:languages_test_flutter/widgets/result_word_widget.dart';

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
            _getTimerFailed()
                ? "Failed to complete in ${test.timeLimit} seconds!"
                : "Score: ${test.result!}%",
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
          const Padding(padding: EdgeInsets.all(3.0)),
          Text(
            "Duration: ${_getDuration(test.timeStarted, test.timeFinished!)}",
            style: const TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          if (test.timeLimit != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Time limit: ${test.timeLimit} seconds",
                style: const TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          const Padding(padding: EdgeInsets.all(10.0)),
          ...test.words!.map((word) => ResultWordWidget(testWord: word)),
        ],
      ),
    );
  }

  int _getNumOfCorrectAnswers() {
    return test.words!
        .map((word) => word.correct != null && word.correct! ? 1 : 0)
        .reduce((value, element) => value + element);
  }

  bool _getTimerFailed() {
    return test.timeLimit != null &&
        test.timeFinished!.difference(test.timeStarted).inSeconds >
            test.timeLimit!;
  }

  String _getDuration(DateTime timeStarted, DateTime timeFinished) {
    Duration duration = timeFinished.difference(timeStarted);
    if (duration.inMinutes == 0) {
      return "${duration.inSeconds} seconds";
    } else if (duration.inMinutes == 1) {
      return "${duration.inMinutes} minute";
    } else {
      return "${duration.inMinutes} minutes";
    }
  }
}
