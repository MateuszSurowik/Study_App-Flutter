import 'package:flutter/material.dart';
import 'package:study_app/data/TranslationData.dart';
import 'package:study_app/widgets/Resume_view.dart';

class ResumePage extends StatelessWidget {
  const ResumePage(this.answears, this.Back, {super.key});
  final List<String> answears;
  final void Function() Back;
  @override
  Widget build(BuildContext context) {
    const Color correct = Color.fromARGB(255, 134, 160, 121);
    const Color uncorrect = Color.fromARGB(255, 155, 64, 64);
    return Column(
      children: [
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              AppBar(
                backgroundColor: const Color.fromARGB(255, 98, 42, 42),
                leading: IconButton(
                    onPressed: Back,
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 30,
                    )),
              ),
              SizedBox(
                height: 150,
              ),
              ...Translationlist.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ResumeView(
                        item.word,
                        answears[Translationlist.indexOf(item)],
                        Translationlist.indexOf(item),
                        item.translations[0] ==
                                answears[Translationlist.indexOf(item)]
                            ? correct
                            : uncorrect),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
