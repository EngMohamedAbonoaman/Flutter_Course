import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_git/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  Future<void> addUser({required String id, required String name}) async {
    // Call the user's CollectionReference to add a new user
    await users
        .add({
          'id': id, // John Doe
          'name': name // Stokes and Sons
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

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
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.deepOrange,
                            ),
                            hintText: "Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
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
                                      .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passController.text,
                                  )
                                      .then((value) {
                                    addUser(
                                            id: value.user!.uid,
                                            name: nameController.text)
                                        .then((value) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    });
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
                                "Sign Up",
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
