import 'package:flutter/material.dart';

class AkhaFarmvilleScreen extends StatelessWidget {
  const AkhaFarmvilleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akha Farmville'),
        backgroundColor: Colors.deepPurple,
        elevation: 5, // เพิ่มเงาให้กับแถบแอป
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30), // ปรับมุมของภาพ
                bottomRight: Radius.circular(30),
              ),
              child: Image.asset(
                'assets/images/AkhaFarmville.jpg',
                width: double.infinity,
                height: 250, // กำหนดความสูงของภาพ
                fit: BoxFit.cover, // ปรับการแสดงผลภาพ
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Akha Farmville',
                    style: TextStyle(
                      fontSize: 28, // ขยายขนาดข้อความ
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple, // ใช้สีที่ตรงกับแถบแอป
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '''Akha Farmville is located in Chiang Rai, Thailand. It offers visitors a chance to explore the beautiful rural landscape, interact with local Akha tribes, and learn about traditional farming and culture.''',
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
                      '''Location: Mae Suai District, Chiang Rai Province\nOpening Hours: 9:00 AM - 6:00 PM\nEntry Fee: 50 THB\nTransportation: Take the Mae Suai bus to reach the farm''',
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
