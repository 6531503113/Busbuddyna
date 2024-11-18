import 'package:flutter/material.dart';

class GoldenTriangleParkScreen extends StatelessWidget {
  const GoldenTriangleParkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Golden Triangle Park'),
        backgroundColor: Colors.teal,
        elevation: 8, // เพิ่มเงาให้แถบแอป
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 255, 255, 255), // สีเขียวเข้ม
              const Color.fromARGB(255, 255, 255, 255), // สีเขียวอ่อน
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(20), // ทำให้มุมของรูปภาพโค้ง
                child: Image.asset(
                  'assets/images/GoldenTrianglePark.jpg', // ใช้รูปจาก assets
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Golden Triangle Park',
                      style: TextStyle(
                        fontSize: 32, // ขยายขนาดข้อความ
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // ให้ข้อความเป็นสีขาว
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '''Golden Triangle Park is located at the confluence of the Mekong River, where Thailand, Laos, and Myanmar meet. This park offers a scenic view of the surrounding landscapes and is a popular spot for tourists visiting the Golden Triangle region.''',
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.6,
                        color: Colors.black, // ให้ข้อความเป็นสีขาว
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Additional Information:',
                      style: TextStyle(
                        fontSize: 22, // ขนาดข้อความที่ใหญ่ขึ้น
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
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
                        ], // เพิ่มเงาให้กล่องข้อมูล
                      ),
                      child: const Text(
                        '''Location: Golden Triangle, Chiang Saen District, Chiang Rai Province\nOpening Hours: 8:00 AM - 5:00 PM\nEntry Fee: Free\nTransportation: Accessible by Chiang Saen bus''',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.black, // สีข้อความที่เหมาะกับพื้นหลัง
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
    );
  }
}
