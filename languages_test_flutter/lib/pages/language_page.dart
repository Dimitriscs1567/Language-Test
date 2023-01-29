import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languages_test_client/languages_test_client.dart';
import 'package:languages_test_flutter/services/get_client.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key, required this.languageCode});

  final String languageCode;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetClient.getClient().language.getByCode(languageCode),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
          );
        }

        if (snapshot.hasError || snapshot.data == null) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => context.go('/'),
              ),
              title: const Text('Error'),
            ),
            body: const Center(
              child: Text('Error'),
            ),
          );
        }

        final language = snapshot.data as Language;

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.go('/'),
            ),
            title: Text(language.name),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.go('/$languageCode/new_test');
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      const Size(200, 40),
                    ),
                  ),
                  child: const Text('New Test'),
                ),
                const Padding(padding: EdgeInsets.all(10.0)),
                ElevatedButton(
                  onPressed: () {
                    context.go('/$languageCode/tests/history');
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      const Size(200, 40),
                    ),
                  ),
                  child: const Text('Test History'),
                ),
                const Padding(padding: EdgeInsets.all(10.0)),
                ElevatedButton(
                  onPressed: () {
                    context.go('/$languageCode/words');
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      const Size(200, 40),
                    ),
                  ),
                  child: const Text('All words'),
                ),
                const Padding(padding: EdgeInsets.all(10.0)),
                ElevatedButton(
                  onPressed: () {
                    context.go('/$languageCode/add_words');
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      const Size(200, 40),
                    ),
                  ),
                  child: const Text('Add words'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
