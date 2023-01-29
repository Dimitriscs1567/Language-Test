import 'package:flutter/material.dart';
import 'package:languages_test_client/languages_test_client.dart';
import 'package:languages_test_flutter/services/get_client.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget(
      {super.key, required this.testWord, required this.updateTest});

  final TestWord testWord;
  final Function updateTest;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Choose the translation of "${widget.testWord.askingWord}":',
            style: const TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(padding: EdgeInsets.all(15)),
          ...widget.testWord.choices.map(
            (choice) => SizedBox(
              width: 250,
              child: ListTile(
                title: Text(
                  choice,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                leading: Radio<String>(
                  value: choice,
                  groupValue: _selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedValue = value;
                    });
                  },
                ),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(15)),
          ElevatedButton(
            onPressed: _selectedValue != null
                ? () async {
                    final result = TestWord(
                      id: widget.testWord.id!,
                      testId: widget.testWord.testId,
                      wordId: widget.testWord.wordId,
                      askingWord: widget.testWord.askingWord,
                      choices: widget.testWord.choices,
                      correctChoice: widget.testWord.correctChoice,
                      answer: _selectedValue,
                      correct: _selectedValue == widget.testWord.correctChoice,
                    );
                    final updated =
                        await GetClient.getClient().testWord.update(result);
                    if (updated != null) {
                      _selectedValue = null;
                      widget.updateTest(updated);
                    }
                  }
                : null,
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                const Size(200, 40),
              ),
            ),
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
