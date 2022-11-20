import 'package:deernier/data/question_list.dart';
import 'package:deernier/page/quiz/score.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final PageController _controller = PageController(initialPage: 0);
  bool isPressed = false;
  int score = 0;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color isNull = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (page) {
              setState(() {
                isPressed = false;
              });
            },
            controller: _controller,
            itemCount: questions.length,
            itemBuilder: (context, index) => Column(children: [
              Row(
                children: [
                  Text(
                    "Question ${index + 1}/ ${questions.length}",
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 1.0,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/sheet.png"))),
                child: Text(
                  questions[index].question!,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              for (int i = 0; i < questions[index].answer!.length; i++)
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: isPressed
                            ? questions[index].answer!.entries.toList()[i].value
                                ? isTrue
                                : isWrong
                            : isNull,
                        fixedSize: Size(MediaQuery.of(context).size.width, 30)),
                    onPressed: isPressed
                        ? () {}
                        : () {
                            setState(() {
                              isPressed = true;
                            });
                            if (questions[index]
                                .answer!
                                .entries
                                .toList()[i]
                                .value) {
                              score += 10;
                            } else {
                              setState(() {
                                isNull = isWrong;
                              });
                            }
                          },
                    child: Text(questions[index].answer!.keys.toList()[i])),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: isPressed
                          ? index + 1 == questions.length
                              ? () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Score(score: score),
                                      ));
                                }
                              : () {
                                  _controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.linear);
                                  setState(() {
                                    isPressed = false;
                                  });
                                }
                          : null,
                      child: Text(index + 1 == questions.length
                          ? "voir le resultat"
                          : "Page suivante"))
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
