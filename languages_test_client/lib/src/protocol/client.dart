/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:languages_test_client/src/protocol/language_class.dart' as _i3;
import 'package:languages_test_client/src/protocol/test_class.dart' as _i4;
import 'package:languages_test_client/src/protocol/test_word_class.dart' as _i5;
import 'package:languages_test_client/src/protocol/word_class.dart' as _i6;
import 'dart:io' as _i7;
import 'protocol.dart' as _i8;

class _EndpointLanguage extends _i1.EndpointRef {
  _EndpointLanguage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'language';

  _i2.Future<List<_i3.Language>> getAll() =>
      caller.callServerEndpoint<List<_i3.Language>>(
        'language',
        'getAll',
        {},
      );

  _i2.Future<_i3.Language?> getByCode(String code) =>
      caller.callServerEndpoint<_i3.Language?>(
        'language',
        'getByCode',
        {'code': code},
      );

  _i2.Future<_i3.Language?> create(_i3.Language language) =>
      caller.callServerEndpoint<_i3.Language?>(
        'language',
        'create',
        {'language': language},
      );

  _i2.Future<_i3.Language?> update(_i3.Language language) =>
      caller.callServerEndpoint<_i3.Language?>(
        'language',
        'update',
        {'language': language},
      );

  _i2.Future<int?> delete(int languageId) => caller.callServerEndpoint<int?>(
        'language',
        'delete',
        {'languageId': languageId},
      );
}

class _EndpointTest extends _i1.EndpointRef {
  _EndpointTest(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'test';

  _i2.Future<_i4.Test?> create(
    int authUserId,
    int languageId,
    int length,
    int? timeLimit,
  ) =>
      caller.callServerEndpoint<_i4.Test?>(
        'test',
        'create',
        {
          'authUserId': authUserId,
          'languageId': languageId,
          'length': length,
          'timeLimit': timeLimit,
        },
      );

  _i2.Future<List<_i4.Test>> getAll(String languageCode) =>
      caller.callServerEndpoint<List<_i4.Test>>(
        'test',
        'getAll',
        {'languageCode': languageCode},
      );

  _i2.Future<_i4.Test?> findById(int id) =>
      caller.callServerEndpoint<_i4.Test?>(
        'test',
        'findById',
        {'id': id},
      );
}

class _EndpointTestWord extends _i1.EndpointRef {
  _EndpointTestWord(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'testWord';

  _i2.Future<_i5.TestWord?> update(_i5.TestWord testWord) =>
      caller.callServerEndpoint<_i5.TestWord?>(
        'testWord',
        'update',
        {'testWord': testWord},
      );
}

class _EndpointWord extends _i1.EndpointRef {
  _EndpointWord(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'word';

  _i2.Future<List<_i6.Word>> getAll(String languageCode) =>
      caller.callServerEndpoint<List<_i6.Word>>(
        'word',
        'getAll',
        {'languageCode': languageCode},
      );

  _i2.Future<_i6.Word?> create(_i6.Word word) =>
      caller.callServerEndpoint<_i6.Word?>(
        'word',
        'create',
        {'word': word},
      );

  _i2.Future<_i6.Word?> update(_i6.Word word) =>
      caller.callServerEndpoint<_i6.Word?>(
        'word',
        'update',
        {'word': word},
      );

  _i2.Future<int?> delete(int wordId) => caller.callServerEndpoint<int?>(
        'word',
        'delete',
        {'wordId': wordId},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i7.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i8.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    language = _EndpointLanguage(this);
    test = _EndpointTest(this);
    testWord = _EndpointTestWord(this);
    word = _EndpointWord(this);
  }

  late final _EndpointLanguage language;

  late final _EndpointTest test;

  late final _EndpointTestWord testWord;

  late final _EndpointWord word;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'language': language,
        'test': test,
        'testWord': testWord,
        'word': word,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
