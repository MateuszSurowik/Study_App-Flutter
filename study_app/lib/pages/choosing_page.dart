import 'package:flutter/material.dart';
import 'package:study_app/widgets/ChoosingPage_ReviewList.dart';

class ChoosingPage extends StatefulWidget {
  const ChoosingPage(this.startGame, {super.key});
  final void Function() startGame;
  @override
  State<ChoosingPage> createState() => _ChoosingPageState();
}

class _ChoosingPageState extends State<ChoosingPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          AppBar(
            backgroundColor: const Color.fromARGB(255, 98, 42, 42),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          ReviewListOnChoosingPage(widget.startGame),
        ],
      ),
    );
  }
}
