/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:languages_test_client/src/protocol/language_class.dart' as _i3;
import 'package:languages_test_client/src/protocol/word_class.dart' as _i4;
import 'dart:io' as _i5;
import 'protocol.dart' as _i6;

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

class _EndpointWord extends _i1.EndpointRef {
  _EndpointWord(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'word';

  _i2.Future<List<_i4.Word>> getAll(String languageCode) =>
      caller.callServerEndpoint<List<_i4.Word>>(
        'word',
        'getAll',
        {'languageCode': languageCode},
      );

  _i2.Future<_i4.Word?> create(_i4.Word word) =>
      caller.callServerEndpoint<_i4.Word?>(
        'word',
        'create',
        {'word': word},
      );

  _i2.Future<_i4.Word?> update(_i4.Word word) =>
      caller.callServerEndpoint<_i4.Word?>(
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
    _i5.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i6.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    language = _EndpointLanguage(this);
    word = _EndpointWord(this);
  }

  late final _EndpointLanguage language;

  late final _EndpointWord word;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'language': language,
        'word': word,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
