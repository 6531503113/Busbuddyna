import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '/model/profile.dart';
<<<<<<< HEAD
import 'homepage.dart';
import 'login.dart';
=======
import 'home.dart';

>>>>>>> 23e573b7010c8ef15e6102590944b40c0db2d080
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
<<<<<<< HEAD
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
                                RequiredValidator(errorText: "กรุณาป้อนอีเมลด้วยครับ"),
                                EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")
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
                              validator: RequiredValidator(errorText: "กรุณาป้อนรหัสผ่านด้วยครับ").call,
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
                                            msg: "สร้างบัญชีผู้ใช้เรียบร้อยแล้ว",
                                            gravity: ToastGravity.TOP);
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(builder: (context) {
                                          return const HomePage();
                                        }));
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      String message;
                                      if (e.code == 'email-already-in-use') {
                                        message = "มีอีเมลนี้ในระบบแล้วครับ โปรดใช้อีเมลอื่นแทน";
                                      } else if (e.code == 'weak-password') {
                                        message = "รหัสผ่านต้องมีความยาว 6 ตัวอักษรขึ้นไป";
                                      } else {
                                        message = e.message ?? "เกิดข้อผิดพลาด";
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
=======
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
              appBar: AppBar(
                title: const Text("สร้างบัญชีผู้ใช้"),
              ),
              body: Container(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("อีเมล", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "กรุณาป้อนอีเมลด้วยครับ"),
                            EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")
                          ]).call,
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String? email) {
                            profile.email = email ?? '';
                          },
>>>>>>> 23e573b7010c8ef15e6102590944b40c0db2d080
                        ),
                        const SizedBox(height: 15),
                        const Text("รหัสผ่าน", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(errorText: "กรุณาป้อนรหัสผ่านด้วยครับ").call,
                          obscureText: true,
                          onSaved: (String? password) {
                            profile.password = password ?? '';
                          },
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: const Text("ลงทะเบียน", style: TextStyle(fontSize: 20)),
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
                                        msg: "สร้างบัญชีผู้ใช้เรียบร้อยแล้ว",
                                        gravity: ToastGravity.TOP);
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const HomeScreen();
                                    }));
                                  });
                                } on FirebaseAuthException catch (e) {
                                  String message;
                                  if (e.code == 'email-already-in-use') {
                                    message = "มีอีเมลนี้ในระบบแล้วครับ โปรดใช้อีเมลอื่นแทน";
                                  } else if (e.code == 'weak-password') {
                                    message = "รหัสผ่านต้องมีความยาว 6 ตัวอักษรขึ้นไป";
                                  } else {
                                    message = e.message ?? "เกิดข้อผิดพลาด";
                                  }
                                  Fluttertoast.showToast(
                                      msg: message,
                                      gravity: ToastGravity.CENTER);
                                }
                              }
                            },
                          ),
                        )
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
        });
  }
}