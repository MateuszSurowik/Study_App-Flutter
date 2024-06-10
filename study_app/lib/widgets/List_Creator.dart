import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';

class ListCreator extends StatefulWidget {
  ListCreator({Key? key}) : super(key: key);

  @override
  State<ListCreator> createState() => _ListCreatorState();
}

class _ListCreatorState extends State<ListCreator> {
  final TextEditingController _listTitleController = TextEditingController();
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _translationController = TextEditingController();

  List<String> words = [];
  List<String> translations = [];

  @override
  Widget build(BuildContext context) => Container(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: _listTitleController,
                maxLength: 20,
                decoration: InputDecoration(labelText: "List Title"),
              ),
              TextField(
                controller: _wordController,
                maxLength: 20,
                decoration: InputDecoration(labelText: "Word"),
              ),
              TextField(
                controller: _translationController,
                maxLength: 20,
                decoration: InputDecoration(labelText: "Translation"),
              ),
              const SizedBox(
                height: 25,
              ),
              OutlinedButton(
                onPressed: _addTranslation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Add",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 98, 42, 42),
                  foregroundColor: Color.fromARGB(255, 164, 141, 141),
                ),
              ),
            ],
          ),
        ),
      );

  Future<void> _addTranslation() async {
    final String listTitle = _listTitleController.text;
    final String word = _wordController.text;
    final String translation = _translationController.text;

    if (listTitle.isEmpty || word.isEmpty || translation.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('All fields are required')),
      );
      return;
    }

    words.add(word);
    translations.add(translation);

    final jsonData = {
      'listTitle': listTitle,
      'words': words,
      'translations': translations,
    };

    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/$listTitle.json');

    if (await file.exists()) {
      // Jeśli plik istnieje, dodajemy nowe dane do istniejącej zawartości
      final existingContent = await file.readAsString();
      final existingData = jsonDecode(existingContent);
      existingData['words'].addAll(words);
      existingData['translations'].addAll(translations);
      await file.writeAsString(jsonEncode(existingData));
    } else {
      // Jeśli plik nie istnieje, tworzymy nowy plik z nowymi danymi
      await file.writeAsString(jsonEncode(jsonData));
    }
    // Wyświetlenie zawartości pliku JSON w konsoli
    String fileContent = await file.readAsString();
    print('Content of $listTitle.json:');
    print(fileContent);
    print(directory.path);
    // Wyczyszczenie pól po dodaniu
    _wordController.clear();
    _translationController.clear();
    // Wyczyszczenie list słów i tłumaczeń po dodaniu
    words.clear();
    translations.clear();
  }
}
