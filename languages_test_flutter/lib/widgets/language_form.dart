import 'package:flutter/material.dart';
import 'package:languages_test_client/languages_test_client.dart';
import 'package:languages_test_flutter/services/get_client.dart';

class LanguageForm extends StatefulWidget {
  const LanguageForm({super.key});

  @override
  State<LanguageForm> createState() => _LanguageFormState();
}

class _LanguageFormState extends State<LanguageForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final codeController = TextEditingController();
  bool exists = false;

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
                const Text(
                  'Add Language',
                ),
                const Padding(padding: EdgeInsets.all(12.0)),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Language Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the language name';
                      }
                      return null;
                    },
                    controller: nameController,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5.0)),
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Language Code',
                    ),
                    onChanged: (_) {
                      if (exists) {
                        setState(() {
                          exists = false;
                        });
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the language code';
                      } else if (exists) {
                        return 'This language code already exists';
                      }
                      return null;
                    },
                    controller: codeController,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(12.0)),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Language? newLanguage =
                          await GetClient.getClient().language.create(
                                Language(
                                  name: nameController.value.text,
                                  code: codeController.value.text,
                                ),
                              );

                      if (newLanguage != null) {
                        Navigator.pop(
                          context,
                          newLanguage,
                        );
                      } else {
                        setState(() {
                          exists = true;
                          _formKey.currentState!.validate();
                        });
                      }
                    }
                  },
                  child: const Text('Create'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
