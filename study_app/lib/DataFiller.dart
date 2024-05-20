import 'package:study_app/models/Translation_model.dart';
import 'package:study_app/data/TranslationData.dart';
import 'dart:math';

class DataFiller {
  DataFiller({required this.words, required this.translations});

  List<String> words = [];
  List<String> translations = [];

  Future<void> fillData() async {
    int number = translations.length - 1;
    for (int i = 0; i < words.length; i++) {
      String correctWord = translations[i];
      List<String> listOfWords = [correctWord];
      for (int j = 1; j < 4; j++) {
        listOfWords.add(translations[Random().nextInt(number)]);
      }
      Translationlist.add(
          TranslationModel(word: words[i], translations: listOfWords));
    }
  }
}
