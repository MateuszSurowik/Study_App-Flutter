import 'package:flutter/material.dart';

class ResumeView extends StatelessWidget {
  ResumeView(this.question, this.answear, this.number, this.correct,
      {super.key});
  final String question;
  final String answear;
  final Color correct;
  int number;
  @override
  Widget build(BuildContext context) {
    number++;
    return Card(
      color: Color.fromARGB(255, 93, 67, 65),
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: correct,
                    shape: CircleBorder(eccentricity: 0.1)),
                onPressed: () {},
                child: Text(
                  number.toString(),
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
                )),
          ),
          const SizedBox(
            width: 80,
          ),
          Column(
            children: [
              Text(
                question,
                style: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 134, 160, 121)),
              ),
              Text(
                answear,
                style: TextStyle(fontSize: 20, color: correct),
              )
            ],
          )
        ],
      ),
    );
  }
}
