import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languages_test_client/languages_test_client.dart';
import 'package:languages_test_flutter/services/get_client.dart';
import 'package:languages_test_flutter/widgets/language_form.dart';
import 'package:languages_test_flutter/widgets/language_widget.dart';

class AllLanguagesPage extends StatefulWidget {
  const AllLanguagesPage({super.key});

  @override
  State<AllLanguagesPage> createState() => _AllLanguagesPageState();
}

class _AllLanguagesPageState extends State<AllLanguagesPage> {
  Future<List<Language>> _getAllLanguages() async {
    return await GetClient.getClient().language.getAll();
  }

  Future<void> _onDelete(int id) async {
    final result = await GetClient.getClient().language.delete(id);
    print(result);
    if (result != null) {
      setState(() {
        _getAllLanguages();
      });
    }
  }

  void _onClick(String code) {
    context.go('/$code');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Test'),
      ),
      body: FutureBuilder(
        future: _getAllLanguages(),
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

          return ListView(
            children: (snapshot.data as List<Language>)
                .map(
                  (lan) => LanguageWidget(
                    language: lan,
                    onDelete: _onDelete,
                    onClick: _onClick,
                  ),
                )
                .toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          showDialog<Language?>(
            context: context,
            builder: (context) => const LanguageForm(),
          ).then((value) {
            if (value != null) {
              setState(() {
                _getAllLanguages();
              });
            }
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
