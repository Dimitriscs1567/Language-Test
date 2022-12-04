import 'package:languages_test_server/src/generated/protocol.dart';
import 'package:serverpod/server.dart';

class WordEndpoint extends Endpoint {
  Future<List<Word>> getAll(Session session, String languageCode) async {
    final languages = await Language.find(
      session,
      where: (t) => t.code.equals(languageCode),
    );

    if (languages.isEmpty) {
      return [];
    }

    return await Word.find(
      session,
      where: (t) => t.languageId.equals(languages.first.id),
    );
  }

  Future<Word?> create(Session session, Word word) async {
    List<Word> existing = await Word.find(
      session,
      where: (t) =>
          t.word.equals(word.word) & t.languageId.equals(word.languageId),
    );

    if (existing.isNotEmpty) {
      for (String translation in word.translations) {
        if (!existing.first.translations.contains(translation)) {
          existing.first.translations.add(translation);
        }
      }

      await Word.update(session, existing.first);
      return existing.first;
    }

    try {
      await Word.insert(session, word);
    } catch (e) {
      return null;
    }

    return (await Word.find(session,
            where: (t) =>
                t.word.equals(word.word) &
                t.languageId.equals(word.languageId)))
        .first;
  }

  Future<Word?> update(Session session, Word word) async {
    bool res = await Word.update(
      session,
      word,
    );

    if (res) {
      return await Word.findById(session, word.id!);
    }

    return null;
  }

  Future<int?> delete(Session session, int wordId) async {
    return await Word.delete(
      session,
      where: (t) => t.id.equals(wordId),
    );
  }
}
