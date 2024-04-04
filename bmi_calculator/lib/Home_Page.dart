import 'dart:math';

import 'package:bmi_calculator/reuslt_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sliderValue = 80;
  bool isMale = false;
  int weight = 20;
  int age = 20;
  double result = 0;
  void swapGender() {
    isMale = !isMale;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF1A1F38),
        title: const Text(
          "BMI calculator",
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w900,
              fontSize: 35),
        ),
      ),
      body: Container(
        color: const Color(0xFF0A0E21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            swapGender();
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isMale
                                  ? Color(0xFF1A1F38)
                                  : Colors.deepOrange,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.female,
                                size: 100,
                                color: Colors.white,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            swapGender();
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isMale
                                  ? Colors.deepOrange
                                  : Color(0xFF1A1F38),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.male,
                                size: 100,
                                color: Colors.white,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF1A1F38),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "HEIGHT",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "CM",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Slider(
                      value: sliderValue,
                      onChanged: (value) {
                        setState(() {
                          sliderValue = value;
                        });
                      },
                      max: 220,
                      min: 50,
                    ),
                    Text(
                      "${sliderValue.round()}",
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF1A1F38),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "WEIGHT",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "$weight",
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.remove),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      if (weight > 0) {
                                        weight--;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child: CircleAvatar(
                                    child: Icon(Icons.add),
                                    backgroundColor: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF1A1F38),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "AGE",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "$age",
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.remove),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      if (age > 0) {
                                        age--;
                                      }
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  child: const CircleAvatar(
                                    child: Icon(Icons.add),
                                    backgroundColor: Colors.white,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xFFF10606),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  )),
              width: double.infinity,
              height: 80,
              child: MaterialButton(
                onPressed: () {
                  result = weight / pow(sliderValue / 100, 2);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ResultScreen(result: result)));
                },
                child: const Text(
                  "CALCULATE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
