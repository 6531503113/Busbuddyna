import 'package:flutter/material.dart';

class ChouiFongScreen extends StatelessWidget {
  const ChouiFongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choui Fong Tea Plantation'),
        backgroundColor: Colors.deepPurple,
        elevation: 5, // เพิ่มเงาให้กับแถบแอป
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: Image.asset(
                'assets/images/ChouiFong.jpg',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choui Fong Tea Plantation',
                    style: TextStyle(
                      fontSize: 28, // ขยายขนาดข้อความ
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple, // ใช้สีที่ตรงกับแถบแอป
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '''Choui Fong Tea Plantation is located in Mae Chan, Chiang Rai. It is one of the most well-known tea plantations in the region. Visitors can enjoy the beautiful views of tea fields and surrounding mountains, learn about the tea production process, and taste various locally grown teas.''',
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.5,
                      color: Colors.grey[800], // ปรับสีของข้อความให้ดูดีขึ้น
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Additional Information:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple, // ใช้สีที่ตรงกับแถบแอป
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50, // พื้นหลังสีอ่อน
                      borderRadius: BorderRadius.circular(10), // มุมโค้ง
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ], // เงา
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      '''Location: Mae Chan District, Chiang Rai Province\nOpening Hours: 8:00 AM - 5:00 PM\nEntry Fee: Free\nTransportation: Take the Mae Chan bus to the plantation''',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.grey[700], // ใช้สีที่อ่อนลง
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
