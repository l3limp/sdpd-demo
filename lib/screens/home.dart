import 'package:flutter/material.dart';
import 'package:sdpdemo/screens/quiz.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 50),
              child: Hero(
                  tag: "hero, bhakti ki shakti",
                  child: Image.asset("assets/images/disney.png")),
            ),
            const SizedBox(height: 20),
            const Text("SDPD",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w300)),
            const SizedBox(height: 5),
            const Text("A quiz on Disney Movies",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 20),
            const Text(
              "Learn the basics of flutter while playing a quiz :)",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(height: height * 0.1),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Quiz()),
                  );
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
                      "Start",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //       foregroundColor: Colors.white,
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            //       shadowColor: Colors.black,
            //       elevation: 3),
            //   onPressed: () {},
            //   child: const Text(
            //     "Christ",
            //     style: TextStyle(fontSize: 18, color: Colors.blue),
            //   ),
            // ),
          ]),
        ),
      )),
    );
  }
}
