import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languages_test_client/languages_test_client.dart';
import 'package:languages_test_flutter/services/file_functions.dart';

import '../services/get_client.dart';

class AddWordsPage extends StatefulWidget {
  const AddWordsPage({super.key, required this.languageCode});

  final String languageCode;

  @override
  State<AddWordsPage> createState() => _AddWordsPageState();
}

class _AddWordsPageState extends State<AddWordsPage> {
  bool loading = false;

  void readFromFile(int languageId) async {
    setState(() {
      loading = true;
    });

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final file = File(result.files.single.path!);
      final wordsContent = await file.readAsString();
      List<Word> words = FileFunctions.getWordsFromFile(
        languageId,
        wordsContent,
      );

      for (Word word in words) {
        await GetClient.getClient().word.create(word);
      }
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: GetClient.getClient().language.getByCode(widget.languageCode),
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
                onPressed: () => context.go('/${widget.languageCode}'),
              ),
              title: Text('Add words for ${language.name}'),
            ),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: loading
                    ? [
                        const CircularProgressIndicator(),
                        const Padding(padding: EdgeInsets.all(10.0)),
                        const Text('Saving new words...'),
                      ]
                    : [
                        ElevatedButton(
                          onPressed: () {
                            readFromFile(language.id!);
                          },
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              const Size(200, 40),
                            ),
                          ),
                          child: const Text('Add words from file'),
                        ),
                        const Padding(padding: EdgeInsets.all(10.0)),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              const Size(200, 40),
                            ),
                          ),
                          child: const Text('Add single word'),
                        ),
                      ],
              ),
            ),
          );
        },
      ),
    );
  }
}
