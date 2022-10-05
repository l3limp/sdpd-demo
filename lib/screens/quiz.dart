import 'package:flutter/material.dart';
import 'package:sdpdemo/screens/score.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

List<String> images = ["shrek", "mermaid", "elsa"];
List<String> questions = [
  "In Shrek, what was the name of the kingdom where the movie is set?",
  "What kind of music does Ariel sing in the movie The Lil' Mermaid?",
  "Princess Elsa has the power to control what, in the movie Frozen?",
];
List<List<String>> options = [
  ["Barely any distance away", "Far Far Away", "Far Cry 3"],
  ["Rap", "Pop", "Country"],
  ["Animals", "Fire", "Ice"]
];
List<int> answers = [1, 0, 2];
int score = 0;

class _QuizState extends State<Quiz> {
  Color correctAnswer = Colors.green;
  Color wrongAnswer = Colors.redAccent;
  Color optionColour = Colors.white;
  Color optionTextColour = const Color.fromRGBO(30, 136, 229, 1);
  int index = 0;

  int chosenIndex =
      4; // to change the colour of only the option that has been selected

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Color.fromARGB(255, 40, 110, 189)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(children: [
              Hero(
                tag: "hero, bhakti ki shakti",
                child: Image.asset(
                  "assets/images/${images[index]}.png",
                  height: 300,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: height * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("question ${index + 1} of 3",
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w300)),
                        Text("Score: $score/3",
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(questions[index],
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w500)),

                    SizedBox(height: height * 0.05),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemBuilder: ((context, optionsIndex) {
                          return GestureDetector(
                            onTap: () async {
                              chosenIndex = optionsIndex;
                              if (index < questions.length) {
                                if (answers[index] == optionsIndex) {
                                  score++;
                                  setState(() {
                                    optionColour = correctAnswer;
                                    optionTextColour = Colors.white;
                                  });

                                  Future.delayed(
                                      const Duration(milliseconds: 1000), () {
                                    chosenIndex = 4;
                                    if (index == 2) {
                                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Score()),
                  );
                                    } else {
                                      setState(() {
                                        index++;
                                      });
                                    }
                                  });
                                } else {
                                  setState(() {
                                    optionColour = wrongAnswer;
                                    optionTextColour = Colors.white;
                                  });
                                  Future.delayed(
                                      const Duration(milliseconds: 1000), () {
                                    optionColour = Colors.white;
                                    optionTextColour =
                                        const Color.fromRGBO(30, 136, 229, 1);
                                    chosenIndex = 4;
                                    if (index == 2) {
                                      Navigator.pop(context);
                                    } else {
                                      setState(() {
                                        index++;
                                      });
                                    }
                                  });
                                  // await Future.delayed(
                                  //     const Duration(milliseconds: 1000), () {
                                  //   setState(() {
                                  //     optionColour = Colors.white;
                                  //     optionTextColour =
                                  //         const Color.fromRGBO(30, 136, 229, 1);
                                  //   });
                                  // });
                                }
                              } else {
                                Navigator.pop(context);
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: width * 0.8,
                              height: 56,
                              decoration: BoxDecoration(
                                  color: chosenIndex == optionsIndex
                                      ? optionColour
                                      : Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(1, 8),
                                        blurRadius: 5,
                                        color: Colors.black12),
                                  ],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              child: Center(
                                child: Text(
                                  options[index][optionsIndex],
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: chosenIndex == optionsIndex
                                          ? optionTextColour
                                          : const Color.fromRGBO(
                                              30, 136, 229, 1),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          );
                        }),
                        itemCount: options.length,
                      ),
                    ),

                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //       foregroundColor: Colors.white,
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 30, vertical: 15),
                    //       shadowColor: Colors.black,
                    //       elevation: 3),
                    //   onPressed: () {},
                    //   child: const Text(
                    //     "Christ",
                    //     style: TextStyle(fontSize: 18, color: Colors.blue),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
