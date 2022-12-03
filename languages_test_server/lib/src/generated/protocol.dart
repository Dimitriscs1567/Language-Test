/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'language_class.dart' as _i2;
import 'test_class.dart' as _i3;
import 'test_word_class.dart' as _i4;
import 'user_class.dart' as _i5;
import 'word_class.dart' as _i6;
import 'protocol.dart' as _i7;
import 'package:languages_test_server/src/generated/language_class.dart' as _i8;
import 'package:serverpod/protocol.dart' as _i9;
export 'language_class.dart';
export 'test_class.dart';
export 'test_word_class.dart';
export 'user_class.dart';
export 'word_class.dart'; // ignore_for_file: equal_keys_in_map

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.Language) {
      return _i2.Language.fromJson(data, this) as T;
    }
    if (t == _i3.Test) {
      return _i3.Test.fromJson(data, this) as T;
    }
    if (t == _i4.TestWord) {
      return _i4.TestWord.fromJson(data, this) as T;
    }
    if (t == _i5.AuthUser) {
      return _i5.AuthUser.fromJson(data, this) as T;
    }
    if (t == _i6.Word) {
      return _i6.Word.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Language?>()) {
      return (data != null ? _i2.Language.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Test?>()) {
      return (data != null ? _i3.Test.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.TestWord?>()) {
      return (data != null ? _i4.TestWord.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.AuthUser?>()) {
      return (data != null ? _i5.AuthUser.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.Word?>()) {
      return (data != null ? _i6.Word.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<List<_i7.TestWord>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i7.TestWord>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    if (t == List<_i8.Language>) {
      return (data as List).map((e) => deserialize<_i8.Language>(e)).toList()
          as dynamic;
    }
    try {
      return _i9.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Language) {
      return 'Language';
    }
    if (data is _i3.Test) {
      return 'Test';
    }
    if (data is _i4.TestWord) {
      return 'TestWord';
    }
    if (data is _i5.AuthUser) {
      return 'AuthUser';
    }
    if (data is _i6.Word) {
      return 'Word';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Language') {
      return deserialize<_i2.Language>(data['data']);
    }
    if (data['className'] == 'Test') {
      return deserialize<_i3.Test>(data['data']);
    }
    if (data['className'] == 'TestWord') {
      return deserialize<_i4.TestWord>(data['data']);
    }
    if (data['className'] == 'AuthUser') {
      return deserialize<_i5.AuthUser>(data['data']);
    }
    if (data['className'] == 'Word') {
      return deserialize<_i6.Word>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i9.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i2.Language:
        return _i2.Language.t;
      case _i3.Test:
        return _i3.Test.t;
      case _i4.TestWord:
        return _i4.TestWord.t;
      case _i5.AuthUser:
        return _i5.AuthUser.t;
      case _i6.Word:
        return _i6.Word.t;
    }
    return null;
  }
}
