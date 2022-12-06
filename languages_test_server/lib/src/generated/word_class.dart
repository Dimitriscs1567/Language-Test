/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class Word extends _i1.TableRow {
  Word({
    int? id,
    required this.languageId,
    required this.word,
    required this.translations,
    this.language,
  }) : super(id);

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

  static final t = WordTable();

  int languageId;

  String word;

  List<String> translations;

  _i2.Language? language;

  @override
  String get tableName => 'word';
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

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'languageId': languageId,
      'word': word,
      'translations': translations,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'languageId': languageId,
      'word': word,
      'translations': translations,
      'language': language,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'languageId':
        languageId = value;
        return;
      case 'word':
        word = value;
        return;
      case 'translations':
        translations = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Word>> find(
    _i1.Session session, {
    WordExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Word>(
      where: where != null ? where(Word.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Word?> findSingleRow(
    _i1.Session session, {
    WordExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Word>(
      where: where != null ? where(Word.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Word?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Word>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required WordExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Word>(
      where: where(Word.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Word row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Word row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Word row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    WordExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Word>(
      where: where != null ? where(Word.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef WordExpressionBuilder = _i1.Expression Function(WordTable);

class WordTable extends _i1.Table {
  WordTable() : super(tableName: 'word');

  final id = _i1.ColumnInt('id');

  final languageId = _i1.ColumnInt('languageId');

  final word = _i1.ColumnString('word');

  final translations = _i1.ColumnSerializable('translations');

  @override
  List<_i1.Column> get columns => [
        id,
        languageId,
        word,
        translations,
      ];
}

@Deprecated('Use WordTable.t instead.')
WordTable tWord = WordTable();
