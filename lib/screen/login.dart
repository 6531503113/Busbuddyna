import 'package:busbuddy/screen/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:busbuddy/model/profile.dart';
import 'welcome.dart';
import 'register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
<<<<<<< HEAD
  Profile profile = Profile(email: '', password: '');
=======
  Profile profile = Profile(email: '', password: ''); // ให้ค่าเริ่มต้นเป็นสตริงว่างสำหรับ email และ password
>>>>>>> 23e573b7010c8ef15e6102590944b40c0db2d080
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
                        "BUSBUDDY",
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
                              "Username",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              validator: MultiValidator([
                                RequiredValidator(errorText: "Please enter your email address."),
                                EmailValidator(errorText: "Email format is invalid."),
                              ]).call,
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (String? email) {
                                profile.email = email ?? '';
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color.fromARGB(255, 242, 226, 245), // สีพื้นหลังของกล่อง
                                prefixIcon: const Icon(Icons.person, color: Color.fromARGB(255, 33, 33, 33)),
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
                              validator: RequiredValidator(errorText: "Please enter your password.").call,
                              obscureText: true,
                               onSaved: (String? password) {
                                profile.password = password ?? '';
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color.fromARGB(255, 242, 226, 245), // สีพื้นหลังของกล่อง
                                prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 33, 33, 33)),
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
                                  "Login",
                                  style: TextStyle(fontSize: 20),
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    try {
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email: profile.email,
                                              password: profile.password)
                                          .then((value) {
                                        formKey.currentState!.reset();
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(builder: (context) {
                                          return const HomePage();
                                        }));
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      Fluttertoast.showToast(
                                          msg: e.message ?? "เกิดข้อผิดพลาด",
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
                            const SizedBox(height: 20),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                                  );
                                },
                                child: const Text(
                                  "Not a member? Create account",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  // ฟังก์ชัน Forgot Password
                                },
                                child: const Text(
                                  "Forgot password?",
                                  style: TextStyle(color: Colors.white70),
                                ),
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
