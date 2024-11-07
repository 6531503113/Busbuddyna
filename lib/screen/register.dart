import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '/model/profile.dart';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '', name: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  Future<void> saveUserProfile(Profile profile) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'email': profile.email,
        'password': profile.password, // ควรเก็บเฉพาะข้อมูลที่ไม่เป็นความลับ
        'name': profile.name, // เก็บชื่อผู้ใช้
      }, SetOptions(merge: true));
    }
  }

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
                      const SizedBox(height: 15),
                      const Text("ชื่อผู้ใช้", style: TextStyle(fontSize: 20)),
                      TextFormField(
                        validator: RequiredValidator(errorText: "กรุณาป้อนชื่อผู้ใช้ด้วยครับ").call,
                        onSaved: (String? name) {
                          profile.name = name ?? '';
                        },
                       decoration: const InputDecoration(
                        labelText: "ชื่อผู้ใช้",
                        labelStyle: TextStyle(fontSize: 20),  // ใช้ labelStyle แทน fontSize
                        ),

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
                                    .then((value) async {
                                  // บันทึกข้อมูลผู้ใช้ลงใน Firestore
                                  await saveUserProfile(profile);

                                  // รีเซ็ตฟอร์มและแสดง Toast
                                  formKey.currentState!.reset();
                                  Fluttertoast.showToast(
                                    msg: "สร้างบัญชีผู้ใช้เรียบร้อยแล้ว",
                                    gravity: ToastGravity.TOP,
                                  );

                                  // เปลี่ยนหน้าไปที่ HomeScreen
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
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
