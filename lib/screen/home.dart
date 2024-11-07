import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login/Register"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20), // เพิ่ม padding
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // เพิ่ม logo
              Image.asset(
                "assets/images/logo.png",
                height: 300, // ปรับขนาดให้เหมาะสม
              ),
              const SizedBox(height: 40), // เว้นระยะห่าง
              // ปุ่มสำหรับเข้าสู่ระบบ (เปลี่ยนตำแหน่ง)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.green, // สีพื้นหลังของปุ่ม
                  ),
                  icon: const Icon(Icons.login),
                  label: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20), // ตั้งค่าขนาดฟอนต์ที่นี่
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ));
                  },
                ),
              ),
              const SizedBox(height: 20), // เว้นระยะห่างระหว่างปุ่ม
              // ปุ่มสำหรับสร้างบัญชีผู้ใช้ (เปลี่ยนตำแหน่ง)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.blue, // สีพื้นหลังของปุ่ม
                  ),
                  icon: const Icon(Icons.add),
                  label: const Text(
                    "Register",
                    style: TextStyle(fontSize: 20), // ตั้งค่าขนาดฟอนต์ที่นี่
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return RegisterScreen();
                      },
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
