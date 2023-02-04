/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class TestWord extends _i1.SerializableEntity {
  TestWord({
    this.id,
    required this.testId,
    required this.wordId,
    required this.askingWord,
    required this.choices,
    required this.correctChoice,
    this.answer,
    this.correct,
    this.word,
  });

  factory TestWord.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return TestWord(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      testId:
          serializationManager.deserialize<int>(jsonSerialization['testId']),
      wordId:
          serializationManager.deserialize<int>(jsonSerialization['wordId']),
      askingWord: serializationManager
          .deserialize<String>(jsonSerialization['askingWord']),
      choices: serializationManager
          .deserialize<List<String>>(jsonSerialization['choices']),
      correctChoice: serializationManager
          .deserialize<String>(jsonSerialization['correctChoice']),
      answer: serializationManager
          .deserialize<String?>(jsonSerialization['answer']),
      correct:
          serializationManager.deserialize<bool?>(jsonSerialization['correct']),
      word: serializationManager
          .deserialize<_i2.Word?>(jsonSerialization['word']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int testId;

  int wordId;

  String askingWord;

  List<String> choices;

  String correctChoice;

  String? answer;

  bool? correct;

  _i2.Word? word;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'testId': testId,
      'wordId': wordId,
      'askingWord': askingWord,
      'choices': choices,
      'correctChoice': correctChoice,
      'answer': answer,
      'correct': correct,
      'word': word,
    };
  }
}
