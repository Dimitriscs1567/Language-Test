/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class Test extends _i1.SerializableEntity {
  Test({
    this.id,
    required this.languageId,
    required this.authUserId,
    this.result,
    required this.length,
    required this.finished,
    required this.timeStarted,
    this.timeFinished,
    this.timeLimit,
    this.words,
    this.language,
  });

  factory Test.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Test(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      languageId: serializationManager
          .deserialize<int>(jsonSerialization['languageId']),
      authUserId: serializationManager
          .deserialize<int>(jsonSerialization['authUserId']),
      result:
          serializationManager.deserialize<int?>(jsonSerialization['result']),
      length:
          serializationManager.deserialize<int>(jsonSerialization['length']),
      finished:
          serializationManager.deserialize<bool>(jsonSerialization['finished']),
      timeStarted: serializationManager
          .deserialize<DateTime>(jsonSerialization['timeStarted']),
      timeFinished: serializationManager
          .deserialize<DateTime?>(jsonSerialization['timeFinished']),
      timeLimit: serializationManager
          .deserialize<int?>(jsonSerialization['timeLimit']),
      words: serializationManager
          .deserialize<List<_i2.TestWord>?>(jsonSerialization['words']),
      language: serializationManager
          .deserialize<_i2.Language?>(jsonSerialization['language']),
    );
  }

  int? id;

  int languageId;

  int authUserId;

  int? result;

  int length;

  bool finished;

  DateTime timeStarted;

  DateTime? timeFinished;

  int? timeLimit;

  List<_i2.TestWord>? words;

  _i2.Language? language;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'languageId': languageId,
      'authUserId': authUserId,
      'result': result,
      'length': length,
      'finished': finished,
      'timeStarted': timeStarted,
      'timeFinished': timeFinished,
      'timeLimit': timeLimit,
      'words': words,
      'language': language,
    };
  }
}
