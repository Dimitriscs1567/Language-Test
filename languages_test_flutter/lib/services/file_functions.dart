import 'package:languages_test_client/languages_test_client.dart';

class FileFunctions {
  static List<Word> getWordsFromFile(int languageId, List<String> lines) {
    List<Word> res = [];

    for (String line in lines) {
      if (line.contains('=')) {
        final wordPart = line.split('=')[0].trim();
        final translationPart = line.split('=')[1].trim();

        final translations = translationPart
            .split('/')
            .map((tr) => tr.trim().toLowerCase())
            .toList();

        if (wordPart.contains('/')) {
          final words = wordPart.split('/').map(
                (w) => Word(
                  languageId: languageId,
                  word: w.trim().toLowerCase(),
                  translations: translations,
                ),
              );

          res.addAll(words);
        } else {
          res.add(
            Word(
              languageId: languageId,
              word: wordPart.trim().toLowerCase(),
              translations: translations,
            ),
          );
        }
      }
    }

    return res;
  }
}
