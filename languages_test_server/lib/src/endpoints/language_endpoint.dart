import 'package:languages_test_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class LanguageEndpoint extends Endpoint {
  Future<List<Language>> getAll(Session session) async {
    return await Language.find(session);
  }

  Future<Language?> getByCode(Session session, String code) async {
    final res = await Language.find(
      session,
      where: (t) => t.code.equals(code),
    );

    if (res.isEmpty) {
      return null;
    }

    return res.first;
  }

  Future<Language?> create(Session session, Language language) async {
    try {
      await Language.insert(session, language);
    } catch (e) {
      return null;
    }

    return (await Language.find(
      session,
      where: (t) => t.code.equals(language.code),
    ))
        .first;
  }

  Future<Language?> update(Session session, Language language) async {
    try {
      await Language.update(session, language);
    } catch (e) {
      return null;
    }

    return (await Language.find(
      session,
      where: (t) => t.code.equals(language.code),
    ))
        .first;
  }

  Future<int?> delete(Session session, int languageId) async {
    return await Language.delete(
      session,
      where: (t) => t.id.equals(languageId),
    );
  }
}
