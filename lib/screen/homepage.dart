import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'table.dart';
import 'welcome.dart'; // นำเข้า WelcomeScreen
import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => TablePage()));
        break;
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
        break;
    }
  }

  // ฟังก์ชันในการเปิดหน้าภาพที่เลือก
  void _openImagePage(String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImagePage(imagePath: imagePath),
      ),
    );
  }

  // ฟังก์ชันแสดง Popup เมื่อกดไอคอนโปรไฟล์
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                }).catchError((error) {
                  print("Logout failed: $error");
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, size: 30),
            onPressed: _showLogoutDialog,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[100]!, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome to the Home Page!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Explore the features of this app by tapping on the images below.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),

              // แถวที่ 1 ของการ์ด (ListView)
              _buildImageRow('Featured Images 1', [
                'assets/images/sample1.jpg',
                'assets/images/sample2.jpg',
                'assets/images/sample3.jpg',
              ]),

              // แถวที่ 2 ของการ์ด (ListView)
              _buildImageRow('Featured Images 2', [
                'assets/images/sample4.jpg',
                'assets/images/sample5.jpg',
                'assets/images/sample6.jpg',
              ]),

              // แถวที่ 3 ของการ์ด (ListView)
              _buildImageRow('Featured Images 3', [
                'assets/images/sample7.jpg',
                'assets/images/sample8.jpg',
                'assets/images/sample9.jpg',
              ]),

              // แถวที่ 4 ของการ์ด (ListView)
              _buildImageRow('Featured Images 4', [
                'assets/images/sample10.jpg',
                'assets/images/sample11.jpg',
                'assets/images/sample12.jpg',
              ]),
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
            icon: Icon(Icons.table_chart),
            label: 'Table',
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

  // ฟังก์ชันในการสร้างแถวการ์ด
  Widget _buildImageRow(String title, List<String> imagePaths) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: imagePaths.map((imagePath) {
                return GestureDetector(
                  onTap: () => _openImagePage(imagePath),
                  child: Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        imagePath,
                        width: 150,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// หน้าจอใหม่ที่แสดงภาพเมื่อผู้ใช้กดการ์ด
class ImagePage extends StatelessWidget {
  final String imagePath;

  const ImagePage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image View'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
