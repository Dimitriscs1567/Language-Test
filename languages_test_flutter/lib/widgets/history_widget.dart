import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languages_test_client/languages_test_client.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key, required this.test});

  final Test test;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Card(
        elevation: 3,
        child: ListTile(
          title: Text(test.finished
              ? _getTimerFailed(test)
                  ? 'Failed to complete in ${test.timeLimit} seconds!'
                  : 'Result: ${test.result}%'
              : 'In progress'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Started: ${_getFormattedTime(test.timeStarted.toString())}',
              ),
              if (test.finished)
                Text(
                  'Duration: ${_getDuration(test.timeStarted, test.timeFinished!)}',
                ),
              if (test.timeLimit != null)
                Text(
                  'Time limit: ${test.timeLimit} seconds',
                ),
            ],
          ),
          trailing: OutlinedButton(
            onPressed: () =>
                context.go('/${test.language!.code}/tests/${test.id}'),
            child: Text(test.finished ? 'Results' : 'Continue'),
          ),
        ),
      ),
    );
  }
}

bool _getTimerFailed(Test test) {
  return test.timeLimit != null &&
      test.timeFinished!.difference(test.timeStarted).inSeconds >
          test.timeLimit!;
}

String _getFormattedTime(String time) {
  var splits = time.split(' ');
  splits[1] = splits[1].substring(0, 5);

  return '${splits[0]} ${splits[1]}';
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
