/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class Test extends _i1.TableRow {
  Test({
    int? id,
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
  }) : super(id);

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

  static final t = TestTable();

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
  String get tableName => 'test';
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

  @override
  Map<String, dynamic> toJsonForDatabase() {
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
    };
  }

  @override
  Map<String, dynamic> allToJson() {
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
      case 'authUserId':
        authUserId = value;
        return;
      case 'result':
        result = value;
        return;
      case 'length':
        length = value;
        return;
      case 'finished':
        finished = value;
        return;
      case 'timeStarted':
        timeStarted = value;
        return;
      case 'timeFinished':
        timeFinished = value;
        return;
      case 'timeLimit':
        timeLimit = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Test>> find(
    _i1.Session session, {
    TestExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Test>(
      where: where != null ? where(Test.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Test?> findSingleRow(
    _i1.Session session, {
    TestExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Test>(
      where: where != null ? where(Test.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Test?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Test>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required TestExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Test>(
      where: where(Test.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Test row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Test row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Test row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    TestExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Test>(
      where: where != null ? where(Test.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef TestExpressionBuilder = _i1.Expression Function(TestTable);

class TestTable extends _i1.Table {
  TestTable() : super(tableName: 'test');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final languageId = _i1.ColumnInt('languageId');

  final authUserId = _i1.ColumnInt('authUserId');

  final result = _i1.ColumnInt('result');

  final length = _i1.ColumnInt('length');

  final finished = _i1.ColumnBool('finished');

  final timeStarted = _i1.ColumnDateTime('timeStarted');

  final timeFinished = _i1.ColumnDateTime('timeFinished');

  final timeLimit = _i1.ColumnInt('timeLimit');

  @override
  List<_i1.Column> get columns => [
        id,
        languageId,
        authUserId,
        result,
        length,
        finished,
        timeStarted,
        timeFinished,
        timeLimit,
      ];
}

@Deprecated('Use TestTable.t instead.')
TestTable tTest = TestTable();
