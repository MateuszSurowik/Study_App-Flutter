import 'package:flutter/material.dart';
import 'package:study_app/data/TranslationData.dart';

class ReviewListOnChoosingPage extends StatefulWidget {
  const ReviewListOnChoosingPage(this.startGame, {super.key});
  final void Function() startGame;

  @override
  State<ReviewListOnChoosingPage> createState() =>
      _ReviewListOnChoosingPageState();
}

class _ReviewListOnChoosingPageState extends State<ReviewListOnChoosingPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          ...Translationlist.map(
            (item) => Card(
              color: const Color.fromARGB(255, 164, 141, 141),
              margin: EdgeInsets.all(15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "daily words",
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      widget.startGame();
                    },
                    icon: Icon(Icons.arrow_right),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
