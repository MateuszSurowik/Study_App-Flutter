import 'package:flutter/material.dart';
import 'package:study_app/data/TranslationData.dart';
import 'package:study_app/pages/ReviewGame.dart';
import 'package:study_app/pages/choosing_page.dart';
import 'package:study_app/pages/main_page.dart';
import 'package:study_app/pages/resume_page.dart';

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
    Widget Page = MainPage(() {
      goToChoosing();
    });
    setState(() {
      if (currentPage == 1) {
        Page = MainPage(() {
          goToChoosing();
        });
      }
      if (currentPage == 2) {
        Page = ChoosingPage(goToGameScreen);
      }
      if (currentPage == 3) {
        Page = ReviweGame(PickAnswaer);
      }
      if (currentPage == 4) {
        Page = ResumePage(Answears, goToChoosing);
      }
    });
    return Page;
  }

  void goToChoosing() {
    setState(() {
      currentPage = 2;
      Answears = [];
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
        if (Translationlist.length == Answears.length) {
          currentPage = 4;
        }
      },
    );
  }

  List<String> Answears = [];

  void PickAnswaer(String answar) {
    Answears.add(answar);
    print(Answears);
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
