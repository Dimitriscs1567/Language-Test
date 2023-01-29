import 'package:languages_test_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TestWordEndpoint extends Endpoint {
  int _getNumOfCorrectAnswers(List<TestWord> words) {
    return words
        .map((word) => word.correct != null && word.correct! ? 1 : 0)
        .reduce((value, element) => value + element);
  }

  int _getScore(List<TestWord> words) {
    return ((_getNumOfCorrectAnswers(words) / words.length) * 100).round();
  }

  Future<TestWord?> update(Session session, TestWord testWord) async {
    try {
      await TestWord.update(session, testWord);
    } catch (e) {
      return null;
    }

    final allTestWords = await TestWord.find(
      session,
      where: (t) => t.testId.equals(testWord.testId),
    );

    bool finishedTest = allTestWords.every((word) => word.correct != null);

    if (finishedTest) {
      var test = (await Test.findById(session, testWord.testId))!;
      test.finished = true;
      test.result = _getScore(allTestWords);
      test.timeFinished = DateTime.now();
      await Test.update(session, test);
    }

    return await TestWord.findById(
      session,
      testWord.id!,
    );
  }
}
