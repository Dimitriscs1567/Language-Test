import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languages_test_client/languages_test_client.dart';
import 'package:languages_test_flutter/widgets/word_widget.dart';

import '../services/get_client.dart';
import '../widgets/deleteDialog.dart';

class AllWordsPage extends StatefulWidget {
  const AllWordsPage({super.key, required this.languageCode});

  final String languageCode;

  @override
  State<AllWordsPage> createState() => _AllWordsPageState();
}

class _AllWordsPageState extends State<AllWordsPage> {
  Future<List<Word>> _getAllWords() async {
    return await GetClient.getClient().word.getAll(widget.languageCode);
  }

  void _onDelete(int wordId) {
    showDialog(context: context, builder: ((context) => const DeleteDialog()))
        .then((value) async {
      if (value) {
        final result = await GetClient.getClient().word.delete(wordId);
        if (result != null) {
          setState(() {
            _getAllWords();
          });
        }
      }
    });
  }

  Future<void> _onEdit(Word word) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/${widget.languageCode}'),
        ),
        title: const Text('Words'),
      ),
      body: FutureBuilder(
        future: _getAllWords(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: (snapshot.data as List<Word>)
                  .map(
                    (word) => WordWidget(
                      word: word,
                      onDelete: _onDelete,
                      onEdit: _onEdit,
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
