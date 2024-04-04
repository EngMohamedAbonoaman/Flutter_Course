import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  double result;
  ResultScreen({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF0A0E21),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Your Result",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 40,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF1A1F38),
                    ),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Normal",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF09FF7A),
                          ),
                        ),
                        Text(
                          "${result.round()}",
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        Text(
                          "culees badan malihide is daji",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
