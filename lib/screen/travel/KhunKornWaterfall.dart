import 'package:flutter/material.dart';

class KhunKornWaterfallScreen extends StatelessWidget {
  const KhunKornWaterfallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khun Korn Waterfall'),
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
                borderRadius: BorderRadius.circular(20), // มุมโค้ง
                child: Image.asset(
                  'assets/images/KhunKornWaterfall.jpg', // ใช้รูปจาก assets
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
                      'Khun Korn Waterfall',
                      style: TextStyle(
                        fontSize: 32, // ขยายขนาดข้อความ
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // ให้ข้อความเป็นสีขาว
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '''Khun Korn Waterfall is a beautiful waterfall located in the northern part of Chiang Rai province, Thailand. It is one of the tallest waterfalls in the region, surrounded by lush forests and a serene atmosphere. The waterfall is a popular destination for nature lovers and hikers. Visitors can enjoy a peaceful walk through the forest before reaching the waterfall.''',
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
                        '''Location: Chiang Rai Province\nOpening Hours: 8:00 AM - 5:00 PM\nEntry Fee: 20 THB\nTransportation: Take the Mueang Chiang Rai bus to reach the waterfall''',
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
