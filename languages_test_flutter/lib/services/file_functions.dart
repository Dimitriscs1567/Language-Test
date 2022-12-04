import 'package:languages_test_client/languages_test_client.dart';

class FileFunctions {
  static List<Word> getWordsFromFile(int languageId, String content) {
    List<Word> res = [];

    final lines = content.split('\n');
    for (String line in lines) {
      if (line.contains('=')) {
        final wordPart = line.split('=')[0].trim();
        final translationPart = line.split('=')[1].trim();

        final translations =
            translationPart.split('/').map((tr) => tr.trim()).toList();

        if (wordPart.contains('/')) {
          final words = wordPart.split('/').map(
                (w) => Word(
                  languageId: languageId,
                  word: w.trim(),
                  translations: translations,
                ),
              );

          res.addAll(words);
        } else {
          res.add(
            Word(
              languageId: languageId,
              word: wordPart.trim(),
              translations: translations,
            ),
          );
        }
      }
    }

    return res;
  }
}
