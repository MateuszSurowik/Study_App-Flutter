import 'dart:math';

class TranslationModel {
  TranslationModel({required this.word, required this.translations});

  String word;
  List<String> translations = [];

  List<String> shuffle() {
    List<String> shuffledList;
    shuffledList = List.of(translations);
    shuffledList.shuffle(Random());
    return shuffledList;
  }
}
