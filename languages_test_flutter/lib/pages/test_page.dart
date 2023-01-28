import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languages_test_client/languages_test_client.dart';

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
  String? _selectedValue;

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
            child: LinearProgressIndicator(
              value: getTestProgress(),
              minHeight: 15,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Choose the translation of "${testWord.askingWord}":',
                  style: const TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(15)),
                ...testWord.choices.map(
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
                  onPressed: _selectedValue != null ? () {} : null,
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      const Size(200, 40),
                    ),
                  ),
                  child: const Text('Next'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  double getTestProgress() {
    int answered = _test!.words!
        .map((word) => word.correct == null ? 0 : 1)
        .reduce((value, element) => value + element);

    return answered / _test!.words!.length;
  }

  TestWord getAskingWordIndex() {
    return _test!.words!.firstWhere((word) => word.answer == null);
  }
}
