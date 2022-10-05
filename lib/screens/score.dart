import 'package:flutter/material.dart';
import 'package:sdpdemo/screens/home.dart';
import 'package:sdpdemo/screens/quiz.dart';

class Score extends StatelessWidget {
  const Score({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Color.fromARGB(255, 40, 110, 189)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your final score: $score/3",
                  style: const TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 80),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  score = 0;
                },
                child: Container(
                  width: width * 0.8,
                  height: 48,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 4),
                            blurRadius: 2,
                            color: Colors.black26),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: const Center(
                    child: Text(
                      "Take me Home, Country Roads",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
