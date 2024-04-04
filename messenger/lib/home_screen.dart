import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: const Color(0xFF000000),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                color: Color(0xFF3B3B3B),
                                shape: BoxShape.circle),
                            child: const Image(
                              image: AssetImage("assets/images/face.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Chats",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Color(0xFF3B3B3B),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Color(0xFF3B3B3B),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit_calendar_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Container(
                        height: 45,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Search",
                            hintStyle: TextStyle(
                              color: Color(0xFF8E8E93),
                            ),
                            fillColor: Color(0xFF3B3B3B),
                            filled: true,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xFF8E8E93),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/face.jpg"),
                                            fit: BoxFit.fill)),
                                  ),
                                  const CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 12,
                                    child: CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Colors.green,
                                    ),
                                  )
                                ],
                              ),
                              const Text(
                                "Martin",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF8E8E93),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView.builder(
                  itemBuilder: (context, index) => Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("assets/images/face.jpg"),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "Martin Randolph",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                Text(
                                  "You:",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white60,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "What's man",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white60,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                CircleAvatar(
                                  backgroundColor: Color(0xFF3B3B3B),
                                  radius: 2,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "09:40 AM",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white60,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.check_circle_outline,
                          size: 20,
                          color: Color(0xFF3B3B3B),
                        )
                      ],
                    ),
                  ),
                  itemCount: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
