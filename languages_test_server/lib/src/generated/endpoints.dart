/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/language_endpoint.dart' as _i2;
import '../endpoints/test_endpoint.dart' as _i3;
import '../endpoints/test_word_endpoint.dart' as _i4;
import '../endpoints/word_endpoint.dart' as _i5;
import 'package:languages_test_server/src/generated/language_class.dart' as _i6;
import 'package:languages_test_server/src/generated/test_word_class.dart'
    as _i7;
import 'package:languages_test_server/src/generated/word_class.dart' as _i8;

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
      'test': _i3.TestEndpoint()
        ..initialize(
          server,
          'test',
          null,
        ),
      'testWord': _i4.TestWordEndpoint()
        ..initialize(
          server,
          'testWord',
          null,
        ),
      'word': _i5.WordEndpoint()
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
              type: _i1.getType<_i6.Language>(),
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
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'language': _i1.ParameterDescription(
              name: 'language',
              type: _i1.getType<_i6.Language>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['language'] as _i2.LanguageEndpoint).update(
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
    connectors['test'] = _i1.EndpointConnector(
      name: 'test',
      endpoint: endpoints['test']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'authUserId': _i1.ParameterDescription(
              name: 'authUserId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'languageId': _i1.ParameterDescription(
              name: 'languageId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'length': _i1.ParameterDescription(
              name: 'length',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'timeLimit': _i1.ParameterDescription(
              name: 'timeLimit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['test'] as _i3.TestEndpoint).create(
            session,
            params['authUserId'],
            params['languageId'],
            params['length'],
            params['timeLimit'],
          ),
        ),
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
              (endpoints['test'] as _i3.TestEndpoint).getAll(
            session,
            params['languageCode'],
          ),
        ),
        'findById': _i1.MethodConnector(
          name: 'findById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['test'] as _i3.TestEndpoint).findById(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['testWord'] = _i1.EndpointConnector(
      name: 'testWord',
      endpoint: endpoints['testWord']!,
      methodConnectors: {
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'testWord': _i1.ParameterDescription(
              name: 'testWord',
              type: _i1.getType<_i7.TestWord>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['testWord'] as _i4.TestWordEndpoint).update(
            session,
            params['testWord'],
          ),
        )
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
              (endpoints['word'] as _i5.WordEndpoint).getAll(
            session,
            params['languageCode'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'word': _i1.ParameterDescription(
              name: 'word',
              type: _i1.getType<_i8.Word>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['word'] as _i5.WordEndpoint).create(
            session,
            params['word'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'word': _i1.ParameterDescription(
              name: 'word',
              type: _i1.getType<_i8.Word>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['word'] as _i5.WordEndpoint).update(
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
              (endpoints['word'] as _i5.WordEndpoint).delete(
            session,
            params['wordId'],
          ),
        ),
      },
    );
  }
}
