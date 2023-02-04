import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languages_test_client/languages_test_client.dart';

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
              children: tests
                  .map(
                    (test) => Card(
                      elevation: 3,
                      child: ListTile(
                        title: Text(test.finished
                            ? 'Result: ${test.result}%'
                            : 'In progress'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Started: ${getFormattedTime(test.timeStarted.toString())}',
                            ),
                            if (test.finished)
                              Text(
                                'Duration: ${getDuration(test.timeStarted, test.timeFinished!)}',
                              ),
                          ],
                        ),
                        trailing: OutlinedButton(
                          onPressed: () => context
                              .go('/${test.language!.code}/tests/${test.id}'),
                          child: Text(test.finished ? 'Results' : 'Continue'),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  String getFormattedTime(String time) {
    var splits = time.split(' ');
    splits[1] = splits[1].substring(0, 5);

    return '${splits[0]} ${splits[1]}';
  }

  String getDuration(DateTime timeStarted, DateTime timeFinished) {
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
