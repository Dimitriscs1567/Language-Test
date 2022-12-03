/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/language_endpoint.dart' as _i2;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'language': _i2.LanguageEndpoint()
        ..initialize(
          server,
          'language',
          null,
        )
    };
    connectors['language'] = _i1.EndpointConnector(
      name: 'language',
      endpoint: endpoints['language']!,
      methodConnectors: {
        'getAllLanguages': _i1.MethodConnector(
          name: 'getAllLanguages',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['language'] as _i2.LanguageEndpoint)
                  .getAllLanguages(session),
        )
      },
    );
  }
}
