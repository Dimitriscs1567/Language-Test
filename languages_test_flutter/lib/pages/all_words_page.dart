import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languages_test_client/languages_test_client.dart';
import 'package:languages_test_flutter/widgets/word_form.dart';
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
  List<Word>? _allWords;
  List<Word> _filteredWords = [];
  final searchController = TextEditingController();

  void _getAllWords() async {
    List<Word> res =
        await GetClient.getClient().word.getAll(widget.languageCode);
    _allWords = res;
    setState(() {
      _filteredWords = _filterWords();
    });
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

  Future<void> _onEdit(Word word) async {
    Word? res = await showDialog(
      context: context,
      builder: ((context) => WordForm(
            word: word,
          )),
    );

    if (res != null) {
      setState(() {
        _getAllWords();
      });
    }
  }

  List<Word> _filterWords() {
    return _allWords!
        .where((word) =>
            word.word.contains(searchController.text) ||
            word.translations.join(',').contains(searchController.text))
        .toList();
  }

  @override
  void initState() {
    _getAllWords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go('/${widget.languageCode}'),
        ),
        title: _allWords != null && _allWords!.isNotEmpty
            ? Text('${_allWords!.first.language!.name} words')
            : const Text('Words'),
      ),
      body: _allWords != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                      bottom: 10.0,
                      left: 6.0,
                      right: 5.0,
                    ),
                    width: double.infinity,
                    child: TextField(
                      decoration: const InputDecoration(
                        label: Text('Search'),
                      ),
                      onChanged: (_) {
                        setState(() {
                          _filteredWords = _filterWords();
                        });
                      },
                      controller: searchController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 30.0,
                      left: 6.0,
                      right: 5.0,
                    ),
                    child: Text(
                      '${_filteredWords.length} words found',
                    ),
                  ),
                  ..._filteredWords
                      .map(
                        (word) => WordWidget(
                          word: word,
                          onDelete: _onDelete,
                          onEdit: _onEdit,
                        ),
                      )
                      .toList()
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
