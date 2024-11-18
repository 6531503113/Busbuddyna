import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '/model/profile.dart';
import 'home.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Error"),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF1F1D36), // สีม่วงเข้ม
                    Color(0xFF3F3351), // สีม่วงกลาง
                    Color(0xFF864879), // สีชมพูม่วง
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "HELLO",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 80),
                      const Text(
                        "Welcome back!",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white54,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Email",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              validator: MultiValidator([
                                RequiredValidator(errorText: "Please enter your email address"),
                                EmailValidator(errorText: "Email format is invalid")
                              ]).call,
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (String? email) {
                                profile.email = email ?? '';
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color.fromARGB(255, 242, 226, 245), // สีพื้นหลังของกล่อง
                                prefixIcon: const Icon(Icons.email, color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none, // เอาขอบออก
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              "Password",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              validator: RequiredValidator(errorText: "Please enter your password").call,
                              obscureText: true,
                              onSaved: (String? password) {
                                profile.password = password ?? '';
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color.fromARGB(255, 242, 226, 245), // สีพื้นหลังของกล่อง
                                prefixIcon: const Icon(Icons.lock, color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none, // เอาขอบออก
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    try {
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: profile.email,
                                              password: profile.password)
                                          .then((value) {
                                        formKey.currentState!.reset();
                                        Fluttertoast.showToast(
                                            msg: "User account created successfully",
                                            gravity: ToastGravity.TOP);
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(builder: (context) {
                                          return const HomeScreen();
                                        }));
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      String message;
                                      if (e.code == 'email-already-in-use') {
                                        message = "This email is already in the system. Please use another email instead";
                                      } else if (e.code == 'weak-password') {
                                        message = "Password must be at least 6 characters long";
                                      } else {
                                        message = e.message ?? "An error occurred";
                                      }
                                      Fluttertoast.showToast(
                                          msg: message,
                                          gravity: ToastGravity.CENTER);
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 223, 177, 213), // สีชมพูม่วงของปุ่ม
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                                      );
                                    },
                                    child: const Text(
                                      "Already a member? Login",
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
