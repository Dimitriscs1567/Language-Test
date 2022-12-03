import 'package:languages_test_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class LanguageEndpoint extends Endpoint {
  Future<List<Language>> getAllLanguages(Session session) async {
    return await Language.find(session);
  }
}
