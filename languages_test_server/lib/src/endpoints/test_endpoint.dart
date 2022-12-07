import 'dart:math';

import 'package:languages_test_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TestEndpoint extends Endpoint {
  Future<Test?> create(
    Session session,
    int authUserId,
    int languageId,
    int length,
  ) async {
    if (await Word.count(session) < length) {
      return null;
    }

    try {
      await Test.insert(
        session,
        Test(
          languageId: languageId,
          authUserId: authUserId,
          length: length,
          finished: false,
          timeStarted: DateTime.now(),
        ),
      );
    } catch (e) {
      return null;
    }

    final test = (await Test.find(
      session,
      where: (t) =>
          t.languageId.equals(languageId) & t.authUserId.equals(authUserId),
      orderBy: Test.t.id,
      orderDescending: true,
    ))
        .first;

    final queryRes = await session.db.query(
        'SELECT * FROM word WHERE "languageId"=1 ORDER BY random() LIMIT 100;');

    final selectedWords = queryRes
        .map(
          (row) => Word(
            id: row[0],
            languageId: row[1],
            word: row[2],
            translations: (row[3] as List<dynamic>)
                .map((value) => value as String)
                .toList(),
          ),
        )
        .toList();

    final allTranslations =
        selectedWords.expand((w) => w.translations).toList();

    final allWords = selectedWords.map((w) => w.word).toList();

    final ran = Random();
    for (int i = 0; i < length; i++) {
      List<String> choices = [];
      String correctChoice;
      String askingWord;
      for (int j = 0; j < 4; j++) {
        bool found = false;
        while (!found) {
          if (i < length / 2) {
            int index = ran.nextInt(allTranslations.length);
            if (!selectedWords[i]
                    .translations
                    .contains(allTranslations[index]) &&
                !choices.contains(allTranslations[index])) {
              choices.add(allTranslations[index]);
              found = true;
            }
          } else {
            int index = ran.nextInt(allWords.length);
            if (selectedWords[i].word.compareTo(allWords[index]) != 0 &&
                !choices.contains(allWords[index])) {
              choices.add(allWords[index]);
              found = true;
            }
          }
        }
      }
      if (i < length / 2) {
        correctChoice = selectedWords[i]
            .translations[ran.nextInt(selectedWords[i].translations.length)];
        choices.add(correctChoice);
        askingWord = selectedWords[i].word;
      } else {
        correctChoice = selectedWords[i].word;
        choices.add(correctChoice);
        askingWord = selectedWords[i]
            .translations[ran.nextInt(selectedWords[i].translations.length)];
      }
      choices.shuffle();
      await TestWord.insert(
        session,
        TestWord(
          testId: test.id!,
          wordId: selectedWords[i].id!,
          askingWord: askingWord,
          choices: choices,
          correctChoice: correctChoice,
        ),
      );
    }

    test.words = await TestWord.find(
      session,
      where: (t) => t.testId.equals(test.id!),
    );

    return test;
  }
}
