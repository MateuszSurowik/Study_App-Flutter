import 'package:flutter/material.dart';
import 'package:study_app/data/TranslationData.dart';
import 'package:study_app/pages/ReviewGame.dart';
import 'package:study_app/pages/choosing_page.dart';
import 'package:study_app/pages/main_page.dart';
import 'package:study_app/pages/resume_page.dart';
import 'package:study_app/models/Translation_model.dart';

class StudyApp extends StatefulWidget {
  const StudyApp({super.key});
  @override
  State<StudyApp> createState() {
    return _StudyAppState();
  }
}

class _StudyAppState extends State<StudyApp> {
  int currentPage = 1;
  Widget? changingScreen() {
    Widget page = MainPage(() {
      goToChoosing();
    });
    setState(() {
      if (currentPage == 1) {
        page = MainPage(() {
          goToChoosing();
        });
      }
      if (currentPage == 2) {
        page = ChoosingPage(goToGameScreen);
      }
      if (currentPage == 3) {
        page = ReviweGame(pickAnswaer);
      }
      if (currentPage == 4) {
        page = ResumePage(answears, goToChoosing);
      }
    });
    return page;
  }

  void goToChoosing() {
    setState(() {
      currentPage = 2;
      answears = [];
      Translationlist = [];
    });
  }

  void goToGameScreen() {
    setState(() {
      currentPage = 3;
    });
  }

  void goToResume() {
    setState(
      () {
        if (Translationlist.length == answears.length) {
          currentPage = 4;
        }
      },
    );
  }

  List<String> answears = [];

  void pickAnswaer(String answar) {
    answears.add(answar);
    goToResume();
  }

  @override
  Widget build(context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 103, 34, 48), // ciemny burgund
                  Color.fromARGB(255, 71, 34, 11)
                ], begin: Alignment.topLeft, end: Alignment.bottomLeft),
                image: DecorationImage(
                    image: AssetImage('lib/assets/images/StartImage1.png'),
                    fit: BoxFit.cover)),
            child: changingScreen(),
          ),
        ));
  }
}
