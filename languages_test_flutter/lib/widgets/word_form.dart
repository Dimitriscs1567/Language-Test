import 'package:flutter/material.dart';
import 'package:languages_test_client/languages_test_client.dart';

import '../services/get_client.dart';

class WordForm extends StatefulWidget {
  const WordForm({super.key, this.language, this.word});

  final Language? language;
  final Word? word;

  @override
  State<WordForm> createState() => _WordFormState();
}

class _WordFormState extends State<WordForm> {
  final _formKey = GlobalKey<FormState>();
  final _wordController = TextEditingController();
  final _translationController = TextEditingController();
  bool _wrong = false;
  bool _loading = false;

  List<String> _makeTranslations(String value) {
    return value
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  @override
  void initState() {
    if (widget.word != null) {
      _wordController.text = widget.word!.word;
      _translationController.text = widget.word!.translations.join(', ');
    }

    super.initState();
  }

  void _onPressed() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
      });

      Word? newWord;
      if (widget.language != null) {
        newWord = await GetClient.getClient().word.create(
              Word(
                languageId: widget.language!.id!,
                word: _wordController.text.trim(),
                translations: _makeTranslations(_translationController.text),
              ),
            );
      } else {
        newWord = await GetClient.getClient().word.update(
              Word(
                id: widget.word!.id!,
                languageId: widget.word!.languageId,
                word: _wordController.text.trim(),
                translations: _makeTranslations(_translationController.text),
              ),
            );
      }

      if (newWord != null) {
        Navigator.pop(context, newWord);
      } else {
        setState(() {
          _loading = false;
          _wrong = true;
          _formKey.currentState!.validate();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.language != null
                      ? 'Add Word for ${widget.language!.name}'
                      : 'Update Word for ${widget.word!.language!.name}',
                ),
                const Padding(padding: EdgeInsets.all(12.0)),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText:
                          'Word in ${widget.language != null ? widget.language!.name : widget.word!.language!.name}',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the word';
                      }
                      return null;
                    },
                    controller: _wordController,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5.0)),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Translations (divided by comma)',
                    ),
                    onChanged: (_) {
                      if (_wrong) {
                        setState(() {
                          _wrong = false;
                        });
                      }
                    },
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          _makeTranslations(value).isEmpty) {
                        return 'Please enter at least one translation';
                      } else if (_wrong) {
                        return widget.language != null
                            ? 'Something went wrong.'
                            : 'This word already exists';
                      }
                      return null;
                    },
                    controller: _translationController,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(12.0)),
                ElevatedButton(
                  onPressed: _loading ? () {} : _onPressed,
                  child: _loading
                      ? const CircularProgressIndicator()
                      : Text(widget.language != null ? 'Create' : 'Update'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
