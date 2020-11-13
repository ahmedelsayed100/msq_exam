import 'dart:math';

import 'package:flutter/material.dart';
import 'package:msq_exam/screens/data.dart';

import '../components.dart';

class Exam extends StatefulWidget {
  static String id = "exam";
  @override
  _ExamState createState() => _ExamState();
}

class _ExamState extends State<Exam> {
  final randomAnswer = Random().nextInt(4);
  var random = Random();
  var _random = Random().nextInt(4);
  Color _color = Colors.blue;
  List<dynamic> userAnswers = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;
    var question = Data.quetions[_random];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Exam"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: screenHeigth * 0.08),
        child: ListView(
          padding: EdgeInsets.all(screenHeigth * 0.04),
          children: [
            questions(
                context: context,
                screenHeigth: screenHeigth,
                screenWidth: screenWidth,
                random: _random),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: screenHeigth * 0.4,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 2,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 20,
                    maxCrossAxisExtent: 150),
                itemBuilder: (context, position) {
                  return customeFlatButton(
                      label: "${Data.answer[_random][position]}",
                      color: _color,
                      myFun: () {
                        userAnswers.add(Data.answer[_random][position]);
                        print(_random);

                        print(userAnswers);
                        // setState(() {
                        userAnswers.remove(Data.answer[_random]);
                        // });
                        print(userAnswers);
                        if (Data.answer[_random].isNotEmpty) {
                          if (Data.answer[_random][position] ==
                              Data.correctAnswers[_random]) {
                            userAnswers.add(Data.correctAnswers[_random]);
                          }
                        }
                      });
                },
                itemCount: 4,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.1,
                right: screenWidth * 0.1,
              ),
              child: customeFlatButton(
                  label: (userAnswers.length <= 5) ? "next" : "show result",
                  color: Colors.green,
                  myFun: () {
                    var n2 = random.nextInt(4);

                    List randoms = [];

                    if (userAnswers.length <= 5) {
                      _random = randomAnswer;
                      if (!randoms.contains(_random)) {
                        randoms.add(_random);
                        setState(() {
                          _random = n2;
                        });
                      } else {
                        setState(() {
                          _random = n2 + 1;
                        });
                      }
                    } else {
                      double result;
                      for (int x = 0; x < userAnswers.length; x++) {
                        if (userAnswers.contains(Data.correctAnswers[x])) {
                          setState(() {
                            result = result + 1.0;
                          });
                        }
                      }
                      print("the result is :${result / 5}");
                      if (result > 2) {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: Text("Congratiolations"),
                                content: Text("goog job try again?"),
                                actions: [
                                  customeFlatButton(
                                      label: "no",
                                      myFun: () {
                                        Navigator.of(context).pop();
                                      }),
                                  customeFlatButton(
                                      label: "yes",
                                      myFun: () {
                                        Navigator.of(context)
                                            .pushNamed('home_screen');
                                      }),
                                ],
                              );
                            });
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text("Sorry"),
                              content: Text("Wrong answer !!😥"),
                              actions: [
                                customeFlatButton(
                                    label: "close",
                                    myFun: () {
                                      print("hi");
                                      Navigator.of(context).pop();
                                    }),
                              ],
                            );
                          },
                        );
                      }
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget questions(
    {BuildContext context,
    double screenWidth,
    double screenHeigth,
    var random}) {
  return StatefulBuilder(builder: (context, StateSetter setState) {
    return Container(
      alignment: Alignment.center,
      width: screenWidth * 0.1,
      height: screenHeigth * 0.1,
      decoration: BoxDecoration(
        color: Colors.grey[500],
      ),
      child: Text(
        "${Data.quetions[random]}",
        style: TextStyle(fontSize: 22, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  });
}
