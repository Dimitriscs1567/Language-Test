/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class AuthUser extends _i1.TableRow {
  AuthUser({
    int? id,
    required this.username,
    this.password,
  }) : super(id);

  factory AuthUser.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return AuthUser(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      username: serializationManager
          .deserialize<String>(jsonSerialization['username']),
      password: serializationManager
          .deserialize<String?>(jsonSerialization['password']),
    );
  }

  static final t = AuthUserTable();

  String username;

  String? password;

  @override
  String get tableName => 'auth_user';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
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
      case 'username':
        username = value;
        return;
      case 'password':
        password = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<AuthUser>> find(
    _i1.Session session, {
    AuthUserExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<AuthUser>(
      where: where != null ? where(AuthUser.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<AuthUser?> findSingleRow(
    _i1.Session session, {
    AuthUserExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<AuthUser>(
      where: where != null ? where(AuthUser.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<AuthUser?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<AuthUser>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required AuthUserExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AuthUser>(
      where: where(AuthUser.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    AuthUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    AuthUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    AuthUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    AuthUserExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AuthUser>(
      where: where != null ? where(AuthUser.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef AuthUserExpressionBuilder = _i1.Expression Function(AuthUserTable);

class AuthUserTable extends _i1.Table {
  AuthUserTable() : super(tableName: 'auth_user');

  final id = _i1.ColumnInt('id');

  final username = _i1.ColumnString('username');

  final password = _i1.ColumnString('password');

  @override
  List<_i1.Column> get columns => [
        id,
        username,
        password,
      ];
}

@Deprecated('Use AuthUserTable.t instead.')
AuthUserTable tAuthUser = AuthUserTable();
