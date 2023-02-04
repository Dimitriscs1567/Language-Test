/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class AuthUser extends _i1.SerializableEntity {
  AuthUser({
    this.id,
    required this.username,
    required this.isAdmin,
  });

  factory AuthUser.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return AuthUser(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      username: serializationManager
          .deserialize<String>(jsonSerialization['username']),
      isAdmin:
          serializationManager.deserialize<bool>(jsonSerialization['isAdmin']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String username;

  bool isAdmin;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'isAdmin': isAdmin,
    };
  }
}
