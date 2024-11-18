import 'package:flutter/material.dart';

class MaeKachanHotSpringScreen extends StatelessWidget {
  const MaeKachanHotSpringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mae Kachan Hot Spring'),
        backgroundColor: Colors.teal,
        elevation: 8, // เพิ่มเงาให้แถบแอป
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 250, 250, 250), // สีเขียวเข้ม
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
                  'assets/images/MaeKachan.webp', // ใช้รูปจาก assets
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
                      'Mae Kachan Hot Spring',
                      style: TextStyle(
                        fontSize: 32, // ขยายขนาดข้อความ
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // ให้ข้อความเป็นสีขาว
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 10),
                        ], // เพิ่มเงาให้ข้อความ
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '''Mae Kachan Hot Spring is located in Wiang Pa Pao District, Chiang Rai. It is a famous natural hot spring known for its therapeutic waters, providing a relaxing experience for visitors.''',
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
                        '''Location: Wiang Pa Pao District, Chiang Rai Province\nOpening Hours: 8:00 AM - 5:00 PM\nEntry Fee: Free\nTransportation: Take the Wiang Pa Pao bus to the hot spring''',
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
