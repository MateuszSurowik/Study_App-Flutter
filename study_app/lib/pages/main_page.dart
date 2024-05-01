import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage(this.changeOnChoosing, {super.key});
  final void Function() changeOnChoosing;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 175,
          ),
          const Text(
            "Let us help you remember more words",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 151, 128, 128),
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 175,
          ),
          OutlinedButton(
            onPressed: () {
              changeOnChoosing();
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 98, 42, 42),
              foregroundColor: const Color.fromARGB(255, 164, 141, 141),
            ),
            child: const Text("Choose Review"),
          ),
        ],
      ),
    );
  }
}
