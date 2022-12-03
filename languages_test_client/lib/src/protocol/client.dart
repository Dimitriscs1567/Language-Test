/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:languages_test_client/src/protocol/language_class.dart' as _i3;
import 'dart:io' as _i4;
import 'protocol.dart' as _i5;

class _EndpointLanguage extends _i1.EndpointRef {
  _EndpointLanguage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'language';

  _i2.Future<List<_i3.Language>> getAllLanguages() =>
      caller.callServerEndpoint<List<_i3.Language>>(
        'language',
        'getAllLanguages',
        {},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i4.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i5.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    language = _EndpointLanguage(this);
  }

  late final _EndpointLanguage language;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'language': language};
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
