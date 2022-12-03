/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Language extends _i1.TableRow {
  Language({
    int? id,
    required this.name,
    required this.code,
  }) : super(id);

  factory Language.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Language(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      code: serializationManager.deserialize<String>(jsonSerialization['code']),
    );
  }

  static final t = LanguageTable();

  String name;

  String code;

  @override
  String get tableName => 'language';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'code': code,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
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
      case 'name':
        name = value;
        return;
      case 'code':
        code = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Language>> find(
    _i1.Session session, {
    LanguageExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Language>(
      where: where != null ? where(Language.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Language?> findSingleRow(
    _i1.Session session, {
    LanguageExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Language>(
      where: where != null ? where(Language.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Language?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Language>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required LanguageExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Language>(
      where: where(Language.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Language row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Language row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Language row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    LanguageExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Language>(
      where: where != null ? where(Language.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef LanguageExpressionBuilder = _i1.Expression Function(LanguageTable);

class LanguageTable extends _i1.Table {
  LanguageTable() : super(tableName: 'language');

  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final code = _i1.ColumnString('code');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        code,
      ];
}

@Deprecated('Use LanguageTable.t instead.')
LanguageTable tLanguage = LanguageTable();
