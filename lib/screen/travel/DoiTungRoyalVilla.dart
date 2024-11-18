import 'package:flutter/material.dart';

class DoiTungRoyalVillaScreen extends StatelessWidget {
  const DoiTungRoyalVillaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doi Tung Royal Villa'),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 8, // เพิ่มเงาให้กับแถบแอป
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 255, 255, 255), // สีส้มเข้ม
              const Color.fromARGB(255, 248, 248, 248), // สีส้มอ่อน
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
                  'assets/images/DoiTungRoyalVilla.jpg', // ใช้รูปจาก assets
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
                      'Doi Tung Royal Villa',
                      style: TextStyle(
                        fontSize: 32, // ขยายขนาดข้อความ
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // ให้ข้อความเป็นสีขา
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '''Doi Tung Royal Villa is a historical site in Chiang Rai, Thailand. It was built by the late Princess Mother, Mom Rajawongse Srinagarindra, to support the development of the region.''',
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
                        ], // เพิ่มเงาให้กล่อง
                      ),
                      child: const Text(
                        '''Location: Doi Tung, Chiang Rai Province\nOpening Hours: 8:00 AM - 5:00 PM\nEntry Fee: 50 THB\nTransportation: Accessible by Mae Fah Luang bus.''',
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
