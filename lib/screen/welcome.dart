import 'package:busbuddy/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:busbuddy/screen/table.dart';
import 'package:busbuddy/screen/welcome.dart'; // นำเข้า WelcomeScreen

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final auth = FirebaseAuth.instance; 
  int _selectedIndex = 2; // ตั้งค่าหน้า Profile เป็นหน้าที่เลือกเริ่มต้น

  // ฟังก์ชันสำหรับเปลี่ยนหน้าเมื่อเลือกแท็บ
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // อัปเดต index ที่เลือก
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TablePage()));
        break;
      case 2:
        // อยู่ที่หน้า Profile อยู่แล้ว
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.blueAccent,
      ),
      body: user == null
          ? const Center(
              child: Text(
                'ไม่พบข้อมูลผู้ใช้',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            )
          : IndexedStack(
              index: _selectedIndex,
              children: [
                const HomePage(),
                const TablePage(),
                _buildProfilePage(user),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'Table',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
      ),
    );
  }

  Widget _buildProfilePage(User user) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[50]!, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 20),
              Text(
                user.email ?? 'ไม่พบข้อมูลผู้ใช้',
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text("Logout"),
                onPressed: () {
                  auth.signOut().then((value) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
