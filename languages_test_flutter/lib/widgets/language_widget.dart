import 'package:flutter/material.dart';
import 'package:languages_test_client/languages_test_client.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    super.key,
    required this.language,
    required this.onDelete,
    required this.onClick,
  });

  final Language language;
  final Function onDelete;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(language.code),
        title: Text(language.name),
        subtitle: Text(language.code),
        trailing: IconButton(
          onPressed: () => onDelete(language.id),
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
