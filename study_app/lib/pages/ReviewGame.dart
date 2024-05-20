import 'package:flutter/material.dart';
import 'package:study_app/data/TranslationData.dart';

class ReviweGame extends StatefulWidget {
  const ReviweGame(this.pickAnswear, {super.key});
  final void Function(String answear) pickAnswear;

  @override
  State<ReviweGame> createState() {
    return _ReviewGameState();
  }
}

class _ReviewGameState extends State<ReviweGame> {
  int i = 0;

  void clickAnswar(String answar) {
    setState(() {
      widget.pickAnswear(answar);
      i++;
    });
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 180,
            ),
            Text(
              Translationlist[i].word,
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 40,
            ),
            ...Translationlist[i].shuffle().map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: TextButton(
                      onPressed: () {
                        clickAnswar(item);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 98, 42, 42),
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                      ),
                      child: Text(
                        item.toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 164, 141, 141),
                        ),
                      ),
                    ),
                  ),
                )
          ],
        ),
      );
}
