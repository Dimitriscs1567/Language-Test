import 'package:flutter/material.dart';
import 'package:languages_test_client/languages_test_client.dart';

class WordWidget extends StatelessWidget {
  const WordWidget({
    super.key,
    required this.word,
    required this.onDelete,
    required this.onEdit,
  });

  final Word word;
  final Function onDelete;
  final Function onEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Card(
        elevation: 3,
        child: ListTile(
          title: Text(word.word),
          subtitle: Text(word.translations.join(', ')),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () => onEdit(word),
                icon: const Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () => onDelete(word.id),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
