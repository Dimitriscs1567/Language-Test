/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class TestWord extends _i1.SerializableEntity {
  TestWord({
    this.id,
    required this.testId,
    required this.wordId,
    required this.choices,
    this.answer,
    this.correct,
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
      choices: serializationManager
          .deserialize<List<String>>(jsonSerialization['choices']),
      answer: serializationManager
          .deserialize<String?>(jsonSerialization['answer']),
      correct:
          serializationManager.deserialize<bool?>(jsonSerialization['correct']),
    );
  }

  int? id;

  int testId;

  int wordId;

  List<String> choices;

  String? answer;

  bool? correct;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'testId': testId,
      'wordId': wordId,
      'choices': choices,
      'answer': answer,
      'correct': correct,
    };
  }
}
