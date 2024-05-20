import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:study_app/data/TranslationData.dart';
import 'package:study_app/jsonManager.dart';
import 'package:study_app/DataFiller.dart';
import 'package:study_app/models/Translation_model.dart';

class ReviewListOnChoosingPage extends StatefulWidget {
  const ReviewListOnChoosingPage(this.startGame, {Key? key}) : super(key: key);
  final void Function() startGame;

  @override
  State<ReviewListOnChoosingPage> createState() =>
      _ReviewListOnChoosingPageState();
}

class _ReviewListOnChoosingPageState extends State<ReviewListOnChoosingPage> {
  final JsonManager _jsonManager = JsonManager();
  List<String> wordsList = [];
  List<String> translationsList = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<String>>(
        future: _jsonManager.getJsonFileNames(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<String> jsonFileNames = snapshot.data!;
            return ListView.builder(
              itemCount: jsonFileNames.length,
              itemBuilder: (context, index) {
                String fileName =
                    path.basenameWithoutExtension(jsonFileNames[index]);
                return Card(
                  color: const Color.fromARGB(255, 164, 141, 141),
                  margin: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          fileName,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () async {
                          // Pobierz dane z pliku JSON
                          String jsonData =
                              await File(jsonFileNames[index]).readAsString();
                          Map<String, dynamic> jsonDataMap =
                              jsonDecode(jsonData);

                          // Pobierz listy words i translations
                          List<dynamic> words = jsonDataMap['words'];
                          List<dynamic> translations =
                              jsonDataMap['translations'];

                          // Konwertuj listy na listy stringów
                          List<String> wordsStrings =
                              words.map((e) => e.toString()).toList();
                          List<String> translationsStrings =
                              translations.map((e) => e.toString()).toList();

                          setState(() {
                            wordsList = wordsStrings;
                            translationsList = translationsStrings;
                          });
                          print(wordsList);
                          // Utwórz instancję DataFiller i wypełnij dane, wywołując metodę fillData()
                          DataFiller dataFiller = DataFiller(
                            words: wordsList,
                            translations: translationsList,
                          );
                          dataFiller.fillData();
                          widget.startGame();
                        },
                        icon: const Icon(Icons.arrow_right),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
