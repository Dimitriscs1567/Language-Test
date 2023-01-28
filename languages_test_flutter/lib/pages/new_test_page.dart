import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languages_test_client/languages_test_client.dart';

import '../services/get_client.dart';

class NewTestPage extends StatefulWidget {
  const NewTestPage({super.key, required this.languageCode});

  final String languageCode;

  @override
  State<NewTestPage> createState() => _NewTestPageState();
}

class _NewTestPageState extends State<NewTestPage> {
  int testLength = 10;
  bool loading = true;
  Language? language;
  final TextEditingController timeLimitControler = TextEditingController();

  Future<void> _getLanguage() async {
    final res =
        await GetClient.getClient().language.getByCode(widget.languageCode);

    setState(() {
      language = res;
      loading = false;
    });
  }

  @override
  void initState() {
    _getLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        ),
      );
    }

    if (language == null) {
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

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/${language!.code}'),
        ),
        title: Text(
          'New test for ${language!.name}',
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Number of questions: ',
                  style: TextStyle(fontSize: 20.0),
                ),
                const Padding(padding: EdgeInsets.all(5.0)),
                DropdownButton<int>(
                  style: const TextStyle(fontSize: 20.0, color: Colors.black),
                  value: testLength,
                  items: [10, 20, 30, 40, 50, 60]
                      .map(
                        (len) => DropdownMenuItem<int>(
                          value: len,
                          child: Text(len.toString()),
                        ),
                      )
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      testLength = newValue!;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Time limit in seconds (leave empty for no limit): ',
                  style: TextStyle(fontSize: 20.0),
                ),
                const Padding(padding: EdgeInsets.all(5.0)),
                SizedBox(
                  width: 50,
                  child: TextField(
                    controller: timeLimitControler,
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(25.0)),
            ElevatedButton(
              onPressed: () async {
                int? timeLimit = int.tryParse(timeLimitControler.text);

                Test? newTest = await GetClient.getClient().test.create(
                      1,
                      language!.id!,
                      testLength,
                      timeLimit != null && timeLimit > 0 ? timeLimit : null,
                    );

                if (newTest != null) {
                  context.go('/${language!.code}/test/${newTest.id}');
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
                child: Text(
                  'Start new test',
                  style: TextStyle(fontSize: 19.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
