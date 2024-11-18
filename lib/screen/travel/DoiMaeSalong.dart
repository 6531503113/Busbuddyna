import 'package:flutter/material.dart';

class DoiMaeSalongScreen extends StatelessWidget {
  const DoiMaeSalongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doi Mae Salong'),
        backgroundColor: Colors.greenAccent,
        elevation: 8, // เพิ่มเงาให้กับแถบแอป
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 255, 255, 255), // เขียวเข้ม
              const Color.fromARGB(255, 255, 255, 255), // เขียวอ่อน
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20), // มุมโค้งให้กับรูป
                child: Image.asset(
                  'assets/images/DoiMaeSalong.jpg', // ใช้รูปจาก assets
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
                      'Doi Mae Salong',
                      style: TextStyle(
                        fontSize: 32, // ขยายขนาดข้อความ
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // ให้ข้อความเป็นสีขาว
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '''Doi Mae Salong is a scenic mountain located in Chiang Rai, Thailand, known for its tea plantations, cool climate, and stunning views.''',
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.6,
                        color: Colors.black, // ทำให้ข้อความอ่านง่าย
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
                        ], // เพิ่มเงาให้กล่อง
                      ),
                      child: const Text(
                        '''Location: Mae Salong, Chiang Saen District, Chiang Rai Province\nOpening Hours: 8:00 AM - 5:00 PM\nEntry Fee: Free\nTransportation: Take the Mae Fah Luang bus to reach the area''',
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
