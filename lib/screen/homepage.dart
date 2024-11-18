import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'table.dart';
import 'travel/AkhaFarmville.dart';
import 'travel/BaanDam.dart';
import 'travel/ChouiFong.dart';
import 'travel/DoiMaeSalong.dart';
import 'travel/DoiPhaTang.dart';
import 'travel/DoiPhuKa.dart';
import 'travel/DoiTung.dart';
import 'travel/DoiTungRoyalVilla.dart';
import 'travel/GoldenTrianglePark.dart';
import 'travel/KhunChaeNationalPark.dart';
import 'travel/KhunKornWaterfall.dart';
import 'travel/MaeSaiBorder.dart';
import 'travel/Maekhachanhotspring.dart';
import 'travel/PhuChiFaForestPark.dart';
import 'travel/PongPhrabatWaterfall.dart';
import 'travel/SinghaPark.dart';
import 'travel/WatHuayPlaKang.dart';
import 'travel/WatPhraKaew.dart';
import 'travel/WatRongKhun.dart';
import 'travel/WatRongSueaTen.dart';
import 'welcome.dart';

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
                Navigator.of(context).pop();
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
        title: const Text(''),
        backgroundColor: Color(0xFF1F1D36), //                            ใช้สีม่วงเข้มสำหรับ AppBar
        elevation: 4,
        shadowColor:
            Color(0xFF3F3351).withOpacity(0.3), // ใช้สีม่วงกลางสำหรับเงา
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
            colors: [
              Color(0xFF1F1D36), // สีม่วงเข้ม
              Color(0xFF3F3351), // สีม่วงกลาง
              Color(0xFF864879), // สีชมพูม่วง
            ],
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
                      'Welcome to Chiang Rai',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // ใช้สีขาวเพื่อให้ข้อความเด่น
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Recommended tourist destinations in Chiang Rai.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white, // ใช้สีขาวเพื่อให้ข้อความเด่น
                      ),
                    ),
                  ],
                ),
              ),
              _buildImageRow(
                'Temples',
                [
                  'assets/images/WatRongKhun.jpg',
                  'assets/images/WatPhraKaew.jpg',
                  'assets/images/WatHuayPlaKang.jpg',
                  'assets/images/WatRongSueaTen.jpg',
                ],
                0,
                [
                  'Wat Rong Khun                          (White Temple)',
                  'Wat Phra Kaew',
                  'Wat Huay Pla Kang',
                  'Wat Rong Suea Ten                      (Blue Temple)',
                  'Wat Phra That Doi Chom Thong'
                ],
                [
                  'Famous white temple with intricate art.',
                  'Historic temple with beautiful architecture.',
                  'Known for the large statue of Guan Yin.',
                  'Stunning blue temple with unique designs.',
                  'Sacred temple with a view of the Golden Triangle.',
                ],
                [
                  'Mueang Chiang Rai',
                  'Mueang Chiang Rai',
                  'Mueang Chiang Rai',
                  'Mueang Chiang Rai',
                  'Chiang Saen',
                ],
              ),
              _buildImageRow(
                'Gardens and Parks',
                [
                  'assets/images/DoiTungRoyalVilla.jpg',
                  'assets/images/SinghaPark.jpg',
                  'assets/images/BaanDam.jpg',
                  'assets/images/GoldenTrianglePark.jpg',
                ],
                4,
                [
                  'Doi Tung Royal Villa and Mae Fah Luang Garden',
                  'Singha Park',
                  'Baan Dam (Black House)',
                  'Golden Triangle Park'
                ],
                [
                  'Royal villa with beautiful gardens and views.',
                  'A vast park with tea plantations and animals.',
                  'Known for its contemporary art and unique buildings.',
                  'Located at the confluence of three countries.',
                ],
                [
                  'Mae Fah Luang',
                  'Mueang Chiang Rai',
                  'Mae Lao',
                  'Chiang Saen',
                ],
              ),
              _buildImageRow(
                'Mountains (Doi)',
                [
                  'assets/images/DoiMaeSalong.jpg',
                  'assets/images/DoiTung.jpg',
                  'assets/images/DoiPhuKa.jpg',
                  'assets/images/DoiPhaTang.jpg',
                ],
                8,
                ['Doi Mae Salong', 'Doi Tung', 'Doi Phu Ka', 'Doi Pha Tang'],
                [
                  'Popular mountain for its tea plantations and views.',
                  'Historical site with royal connections and gardens.',
                  'A secluded mountain with a serene environment.',
                  'Breathtaking mountain peaks with views of Laos.',
                ],
                [
                  'Mae Fah Luang',
                  'Mae Fah Luang',
                  'Mae Fah Luang',
                  'Chiang Saen',
                  'Mueang Chiang Rai',
                ],
              ),
              _buildImageRow(
                'National Parks & Waterfall',
                [
                  'assets/images/PhuChiFaForestPark.jpg',
                  'assets/images/KhunChaeNationalPark.jpg',
                  'assets/images/KhunKornWaterfall.jpg',
                  'assets/images/PongPhrabatWaterfall.jpg',
                ],
                12,
                [
                  'Phu Chi Fa Forest Park',
                  'Khun Chae National Park',
                  'Khun Korn Waterfall',
                  'Pong Phrabat Waterfall'
                ],
                [
                  'Popular viewpoint for sunrise and views over Laos.',
                  'Forest reserve with rich biodiversity.',
                  'Khunkorn Waterfall is 70 meters high.',
                  'A waterfall that has the characteristics of a rocky rapid.'
                ],
                [
                  'Chiang Rai',
                  'Mueang Chiang Rai',
                  'Mueang Chiang Rai',
                  ' Mueang Chiang Rai ',
                ],
              ),
              _buildImageRow(
                'Attractions',
                [
                  'assets/images/AkhaFarmville.jpg',
                  'assets/images/MaeSaiBorder.jpg',
                  'assets/images/ChouiFongTea.jpg',
                  'assets/images/maekhachanhotspring.jpg',
                ],
                16,
                [
                  'akha farmville',
                  'Mae Sai Border',
                  'Choui Fong Tea',
                  'Mae khachan hot spring'
                ],
                [
                  'A farm with sheep, a cafe, and mountain views​.',
                  'The northernmost point of Thailand.',
                  'Amidst the tea gardens and mountains.',
                  'Relax at the natural hot springs.',
                ],
                [
                  'Mae Suai',
                  'Mae Sai',
                  'Mae Chan',
                  'Wiang Pa Pao',
                ],
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
            icon: Icon(Icons.table_chart),
            label: 'Table',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xFF864879), // ใช้สีชมพูม่วงสำหรับการเลือก
        unselectedItemColor:
            const Color.fromARGB(255, 151, 151, 151).withOpacity(0.7), // สีขาวอ่อนสำหรับไอคอนที่ไม่ได้เลือก
        backgroundColor: Color.fromARGB(255, 255, 255,
            255), // สีม่วงเข้มสำหรับ Background ของ Bottom Navigation
      ),
    );
  }

  Widget _buildImageRow(
    String title,
    List<String> imagePaths,
    int startIndex,
    List<String> captions,
    List<String> subtitles,
    List<String> districts,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              
              fontWeight: FontWeight.w600,
              color: Colors.white, // ใช้สีขาวสำหรับข้อความ
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 380,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: imagePaths.asMap().entries.map((entry) {
                final index = entry.key + startIndex;
                final imagePath = entry.value;
                final caption = captions[entry.key];
                final subtitle = subtitles[entry.key];
                final district = districts[entry.key];

                return GestureDetector(
                  onTap: () {
                    _navigateToPage(index);
                  },
                  child: Container(
                    width: 330,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 2), // เพิ่มสีกรอบด้วยสีชมพูม่วง
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 4,
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          child: Image.asset(
                            imagePath,
                            width: double.infinity,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            caption,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0), // ใช้สีม่วงเข้ม
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            subtitle,
                            style: const TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          district,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 100, 97, 97),
                          ),
                        ),
                      ],
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

  void _navigateToPage(int index) {
    final List<Widget> pages = [
      WatRongKhunPage(),
      WatPhraKaewPage(),
      WatHuayPlaKangPage(),
      WatRongSueaTenPage(),
      const DoiTungRoyalVillaScreen(),
      const SinghaParkScreen(),
      const BaanDamScreen(),
      const GoldenTriangleParkScreen(),
      const DoiMaeSalongScreen(),
      const DoiTungScreen(),
      const DoiPhuKaScreen(),
      const DoiPhaTangScreen(),
      const PhuChiFaForestParkScreen(),
      const KhunChaeNationalParkScreen(),
      const KhunKornWaterfallScreen(),
      const PongPhrabatWaterfallScreen(),
      const AkhaFarmvilleScreen(),
      const MaeSaiBorderScreen(),
      const ChouiFongScreen(),
      const MaeKachanHotSpringScreen(),
    ];

    if (index >= 0 && index < pages.length) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => pages[index]),
      );
    }
  }
}
