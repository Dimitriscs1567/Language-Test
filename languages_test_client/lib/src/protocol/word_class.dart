/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

class Word extends _i1.SerializableEntity {
  Word({
    this.id,
    required this.languageId,
    required this.word,
    required this.translations,
    this.language,
  });

  factory Word.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Word(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      languageId: serializationManager
          .deserialize<int>(jsonSerialization['languageId']),
      word: serializationManager.deserialize<String>(jsonSerialization['word']),
      translations: serializationManager
          .deserialize<List<String>>(jsonSerialization['translations']),
      language: serializationManager
          .deserialize<_i2.Language?>(jsonSerialization['language']),
    );
  }

  int? id;

  int languageId;

  String word;

  List<String> translations;

  _i2.Language? language;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'languageId': languageId,
      'word': word,
      'translations': translations,
      'language': language,
    };
  }
}
