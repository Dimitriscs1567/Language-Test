import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languages_test_client/languages_test_client.dart';
import 'package:languages_test_flutter/widgets/question_widget.dart';
import 'package:languages_test_flutter/widgets/test_results_widget.dart';

import '../services/get_client.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key, required this.testId});

  final int testId;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  bool _loading = true;
  Test? _test;

  @override
  void initState() {
    GetClient.getClient()
        .test
        .findById(widget.testId)
        .then((value) => setState(() {
              _test = value;
              _loading = false;
            }));
    super.initState();
  }

  void updateTest(TestWord updated) async {
    if (_test != null) {
      int index = _test!.words!.indexWhere((word) => word.id == updated.id);
      _test!.words![index] = updated;
      if (_getNumOfAnswered() == _test!.words!.length) {
        _test = await GetClient.getClient().test.findById(widget.testId);
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        ),
      );
    }

    if (_test == null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.go('/'),
          ),
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    }

    if (_test!.finished) {
      return TestResultsWidget(test: _test!);
    }

    TestWord testWord = getAskingWordIndex();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/${_test!.language!.code}'),
        ),
        title: Text(
          'Test for ${_test!.language!.name}',
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LinearProgressIndicator(
                  value: _getNumOfAnswered() / _test!.words!.length,
                  minHeight: 15,
                ),
                const Padding(padding: EdgeInsets.all(5.0)),
                Text(
                  'Question ${_getNumOfAnswered() + 1} / ${_test!.words!.length}',
                  style: const TextStyle(fontSize: 16.0),
                )
              ],
            ),
          ),
          QuestionWidget(
            testWord: testWord,
            updateTest: updateTest,
          ),
        ],
      ),
    );
  }

  int _getNumOfAnswered() {
    return _test!.words!
        .map((word) => word.correct == null ? 0 : 1)
        .reduce((value, element) => value + element);
  }

  TestWord getAskingWordIndex() {
    return _test!.words!.firstWhere((word) => word.answer == null);
  }
}
