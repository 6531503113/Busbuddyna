import 'package:flutter/material.dart';
import 'home.dart';
import 'searchpage.dart';
import 'welcome.dart';
import 'homepage.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  int _selectedIndex = 2; // ตั้งค่าให้ Favorites เป็นหน้าที่เลือก

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // ปรับ _selectedIndex ให้ตรงกับที่ถูกเลือก
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SearchPage()));
        break;
      case 2:
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FavoritesPage()));
        break;
      case 3:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.blueAccent, // สีพื้นหลังของ AppBar
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[100]!, Colors.white], // พื้นหลังเป็น gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite, // ใช้ไอคอนหัวใจ
                size: 100,
                color: Colors.red, // เปลี่ยนสีไอคอน
              ),
              const SizedBox(height: 20),
              const Text(
                'Favorites Page',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87, // สีข้อความ
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Here you can find your favorite items!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54, // สีข้อความรอง
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Like',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey
      ),
    );
  }
}
