import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languages_test_client/languages_test_client.dart';
import 'package:languages_test_flutter/widgets/history_widget.dart';

import '../services/get_client.dart';

class TestsHistory extends StatelessWidget {
  const TestsHistory({super.key, required this.languageCode});

  final String languageCode;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetClient.getClient().test.getAll(languageCode),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          );
        }

        if (snapshot.hasError || snapshot.data == null) {
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

        final tests = snapshot.data as List<Test>;

        if (tests.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => context.go('/$languageCode'),
              ),
              title: const Text('No tests'),
            ),
            body: const Center(
              child: Text('No tests found!'),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.go('/$languageCode'),
            ),
            title: Text(tests[0].language!.name),
          ),
          body: SizedBox(
            width: double.infinity,
            child: ListView(
              children: tests.map((test) => HistoryWidget(test: test)).toList(),
            ),
          ),
        );
      },
    );
  }
}
