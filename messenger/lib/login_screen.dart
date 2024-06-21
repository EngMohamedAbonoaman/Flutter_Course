import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Icon(
                      Icons.abc_rounded,
                      size: 100,
                      color: Colors.red[300],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Text(
                          "Login Up",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // TextFormField(
                        //   decoration: InputDecoration(
                        //     contentPadding: const EdgeInsets.all(10),
                        //     filled: true,
                        //     fillColor: Colors.white,
                        //     prefixIcon: const Icon(
                        //       Icons.person,
                        //       color: Colors.deepOrange,
                        //     ),
                        //     hintText: "Name",
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(25),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.deepOrange,
                            ),
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: passController,
                          obscureText: true,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.deepOrange,
                            ),
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.check_box,
                              color: Colors.deepOrange,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("I accept all the terms"),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: double.infinity,
                            child: MaterialButton(
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });

                                try {
                                  FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passController.text,
                                  )
                                      .then((value) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    print(value.user!.uid);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("User Logged in"),
                                      ),
                                    );
                                  }).catchError((onError) {
                                    print(onError.toString());
                                  });
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    print('The password provided is too weak.');
                                  } else if (e.code == 'email-already-in-use') {
                                    print(
                                        'The account already exists for that email.');
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                              child: const Text(
                                "Log In",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Text(""),
                  flex: 1,
                ),
              ],
            ),
    );
  }
}
