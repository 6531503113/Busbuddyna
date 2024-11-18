import 'package:flutter/material.dart';

class BaanDamScreen extends StatelessWidget {
  const BaanDamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Baan Dam (Black House)'),
        backgroundColor: Colors.deepPurple, // ใช้สีที่เหมาะสมกับธีม
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
                'assets/images/BaanDam.jpg',
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
                    'Baan Dam (Black House)',
                    style: TextStyle(
                      fontSize: 28, // ขยายขนาดข้อความให้ใหญ่ขึ้น
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple, // สีตรงกับธีม
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '''Baan Dam, also known as the Black House, is an art and architecture museum located in Chiang Rai, Thailand. It is a unique collection of black-painted buildings and structures, showcasing the work of Thai artist Thawan Duchanee.''',
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.5,
                      color: Colors.grey[800], // ใช้สีที่ทำให้ข้อความอ่านง่าย
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Additional Information:',
                    style: TextStyle(
                      fontSize: 20, // ขยายขนาดข้อความ
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple, // สีที่ตรงกับธีม
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
                      '''Location: Mueang Chiang Rai District, Chiang Rai Province\nOpening Hours: 8:00 AM - 5:00 PM\nEntry Fee: 80 THB\nTransportation: Accessible by Mae Lao bus''',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.grey[700], // ใช้สีที่เหมาะสม
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
