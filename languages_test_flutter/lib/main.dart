import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languages_test_flutter/pages/add_words_page.dart';
import 'package:languages_test_flutter/pages/all_languages_page.dart';
import 'package:languages_test_flutter/pages/all_words_page.dart';
import 'package:languages_test_flutter/pages/language_page.dart';
import 'package:languages_test_flutter/pages/new_test_page.dart';
import 'package:languages_test_flutter/pages/test_page.dart';
import 'package:languages_test_flutter/pages/tests_history.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Language Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: GoRouter(
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            builder: (context, state) => const AllLanguagesPage(),
          ),
          GoRoute(
            path: '/:languageCode',
            builder: (context, state) => LanguagePage(
              languageCode: state.params['languageCode']!,
            ),
            routes: [
              GoRoute(
                path: 'add_words',
                builder: (context, state) => AddWordsPage(
                  languageCode: state.params['languageCode']!,
                ),
              ),
              GoRoute(
                path: 'words',
                builder: (context, state) => AllWordsPage(
                  languageCode: state.params['languageCode']!,
                ),
              ),
              GoRoute(
                path: 'new_test',
                builder: (context, state) => NewTestPage(
                  languageCode: state.params['languageCode']!,
                ),
              ),
              GoRoute(
                path: 'tests/history',
                builder: (context, state) => TestsHistory(
                  languageCode: state.params['languageCode']!,
                ),
              ),
              GoRoute(
                path: 'tests/:testId',
                builder: (context, state) => TestPage(
                  testId: int.parse(state.params['testId']!),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
