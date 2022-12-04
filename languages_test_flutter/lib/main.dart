import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languages_test_flutter/pages/all_languages_page.dart';
import 'package:languages_test_flutter/pages/language_page.dart';

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
      routerConfig: GoRouter(routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) => const AllLanguagesPage(),
        ),
        GoRoute(
          path: '/:languageCode',
          builder: (context, state) => LanguagePage(
            languageCode: state.params['languageCode']!,
          ),
        )
      ]),
    );
  }
}
