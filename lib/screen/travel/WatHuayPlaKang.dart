import 'package:flutter/material.dart';

class WatHuayPlaKangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wat Huay Pla Kang, Chiang Rai'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 255, 255, 255), // สีน้ำเงินเข้ม
              const Color.fromARGB(255, 255, 255, 255), // สีน้ำเงินอ่อน
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image of Wat Huay Pla Kang
                ClipRRect(
                  borderRadius: BorderRadius.circular(20), // มุมโค้ง
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/WatHuayPlaKang.jpg',
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Title
                Text(
                  'Wat Huay Pla Kang',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),

                // Description
                const Text(
                  '''Wat Huay Pla Kang is a Buddhist temple located in Chiang Rai, Thailand. It is famous for its large statue of the Goddess of Mercy, Guanyin, and peaceful atmosphere.''',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 20),

                // Additional Information Section
                const Text(
                  'Additional Information:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),

                // Information Box
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50, // พื้นหลังสีอ่อน
                    borderRadius: BorderRadius.circular(10), // มุมโค้ง
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ], // เพิ่มเงาให้กรอบ
                  ),
                  child: const Text(
                    '''Location: Mueang Chiang Rai, Chiang Rai Province
Opening Hours: 8:00 AM - 5:00 PM
Entry Fee: Free
Transportation: Accessible by Mueang Chiang Rai bus''',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
