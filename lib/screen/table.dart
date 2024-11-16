import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:busbuddy/screen/homepage.dart';
import 'package:busbuddy/screen/welcome.dart';
import 'package:busbuddy/screen/tableall/lightgreen.dart';
import 'package:busbuddy/screen/tableall/green.dart';
import 'package:busbuddy/screen/tableall/red.dart';
import 'package:busbuddy/screen/tableall/blue.dart';
import 'package:busbuddy/screen/home.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        break;
      case 1:
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
        break;
    }
  }

  // ฟังก์ชันสำหรับสร้างการ์ด
  Widget _buildCard(String title, String imagePath, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Card(
        elevation: 8,
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                imagePath,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                child: const Text(
                  'เริ่มใช้งาน',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table Menu'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app , size: 30), // ไอคอนสำหรับการออกจากระบบ
            onPressed: () {
              _showLogoutDialog(); // เรียกใช้ฟังก์ชันแสดง Popup Logout
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 1, // กำหนดจำนวนการ์ดต่อแถว
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildCard('ควย', 'assets/images/logo1.png', const GreenPage()),
            _buildCard('อ่านทำเหี้ยไร', 'assets/images/logo1.png', const LightgreenPage()),
            _buildCard('ยังจะอ่านอีก', 'assets/images/logo1.png', const RedPage()),
            _buildCard('กาก', 'assets/images/logo1.png', const BluePage()),
          ],
        ),
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
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // ปิด Popup
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  // นำไปหน้า Home หรือหน้าล็อกอินใหม่เมื่อออกจากระบบ
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                }).catchError((error) {
                  // แสดงข้อผิดพลาดถ้ามี
                  print("Logout failed: $error");
                });
              },
            ),
          ],
        );
      },
    );
  }
}
