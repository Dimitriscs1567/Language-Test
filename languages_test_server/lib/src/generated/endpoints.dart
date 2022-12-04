/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/language_endpoint.dart' as _i2;
import '../endpoints/word_endpoint.dart' as _i3;
import 'package:languages_test_server/src/generated/language_class.dart' as _i4;
import 'package:languages_test_server/src/generated/word_class.dart' as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'language': _i2.LanguageEndpoint()
        ..initialize(
          server,
          'language',
          null,
        ),
      'word': _i3.WordEndpoint()
        ..initialize(
          server,
          'word',
          null,
        ),
    };
    connectors['language'] = _i1.EndpointConnector(
      name: 'language',
      endpoint: endpoints['language']!,
      methodConnectors: {
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['language'] as _i2.LanguageEndpoint).getAll(session),
        ),
        'getByCode': _i1.MethodConnector(
          name: 'getByCode',
          params: {
            'code': _i1.ParameterDescription(
              name: 'code',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['language'] as _i2.LanguageEndpoint).getByCode(
            session,
            params['code'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i4.Language>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['language'] as _i2.LanguageEndpoint).create(
            session,
            params['language'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'languageId': _i1.ParameterDescription(
              name: 'languageId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['language'] as _i2.LanguageEndpoint).delete(
            session,
            params['languageId'],
          ),
        ),
      },
    );
    connectors['word'] = _i1.EndpointConnector(
      name: 'word',
      endpoint: endpoints['word']!,
      methodConnectors: {
        'getAll': _i1.MethodConnector(
          name: 'getAll',
          params: {
            'languageCode': _i1.ParameterDescription(
              name: 'languageCode',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['word'] as _i3.WordEndpoint).getAll(
            session,
            params['languageCode'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'word': _i1.ParameterDescription(
              name: 'word',
              type: _i1.getType<_i5.Word>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['word'] as _i3.WordEndpoint).create(
            session,
            params['word'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'word': _i1.ParameterDescription(
              name: 'word',
              type: _i1.getType<_i5.Word>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['word'] as _i3.WordEndpoint).update(
            session,
            params['word'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'wordId': _i1.ParameterDescription(
              name: 'wordId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['word'] as _i3.WordEndpoint).delete(
            session,
            params['wordId'],
          ),
        ),
      },
    );
  }
}
