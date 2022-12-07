/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class TestWord extends _i1.TableRow {
  TestWord({
    int? id,
    required this.testId,
    required this.wordId,
    required this.askingWord,
    required this.choices,
    required this.correctChoice,
    this.answer,
    this.correct,
    this.word,
  }) : super(id);

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

  static final t = TestWordTable();

  int testId;

  int wordId;

  String askingWord;

  List<String> choices;

  String correctChoice;

  String? answer;

  bool? correct;

  _i2.Word? word;

  @override
  String get tableName => 'test_word';
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

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'testId': testId,
      'wordId': wordId,
      'askingWord': askingWord,
      'choices': choices,
      'correctChoice': correctChoice,
      'answer': answer,
      'correct': correct,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
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

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'testId':
        testId = value;
        return;
      case 'wordId':
        wordId = value;
        return;
      case 'askingWord':
        askingWord = value;
        return;
      case 'choices':
        choices = value;
        return;
      case 'correctChoice':
        correctChoice = value;
        return;
      case 'answer':
        answer = value;
        return;
      case 'correct':
        correct = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<TestWord>> find(
    _i1.Session session, {
    TestWordExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TestWord>(
      where: where != null ? where(TestWord.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<TestWord?> findSingleRow(
    _i1.Session session, {
    TestWordExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<TestWord>(
      where: where != null ? where(TestWord.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<TestWord?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<TestWord>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required TestWordExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TestWord>(
      where: where(TestWord.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    TestWord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    TestWord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    TestWord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    TestWordExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TestWord>(
      where: where != null ? where(TestWord.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef TestWordExpressionBuilder = _i1.Expression Function(TestWordTable);

class TestWordTable extends _i1.Table {
  TestWordTable() : super(tableName: 'test_word');

  final id = _i1.ColumnInt('id');

  final testId = _i1.ColumnInt('testId');

  final wordId = _i1.ColumnInt('wordId');

  final askingWord = _i1.ColumnString('askingWord');

  final choices = _i1.ColumnSerializable('choices');

  final correctChoice = _i1.ColumnString('correctChoice');

  final answer = _i1.ColumnString('answer');

  final correct = _i1.ColumnBool('correct');

  @override
  List<_i1.Column> get columns => [
        id,
        testId,
        wordId,
        askingWord,
        choices,
        correctChoice,
        answer,
        correct,
      ];
}

@Deprecated('Use TestWordTable.t instead.')
TestWordTable tTestWord = TestWordTable();
