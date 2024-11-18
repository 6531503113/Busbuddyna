import 'package:busbuddy/screen/table.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RedPage());
}

class RedPage extends StatelessWidget {
  const RedPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FlightListPage(),
    );
  }
}

class FlightListPage extends StatelessWidget {
  const FlightListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 234, 211, 225),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // ไอคอนลูกศรย้อนกลับ
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TablePage(), // ลิ้งไปหน้า HomePage
                  ),
                );
              },
            ),

        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // ฟังก์ชันกรองข้อมูล
            },
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
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                "CHIANG RAI - MAE KHACHAN",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // เปลี่ยนสีข้อความเป็นสีขาวเพื่อให้ชัดเจนขึ้น
                ),
                textAlign: TextAlign.center,
              ),
            ),
            _buildTravelCard(
              departureTime: "07.20 AM",
              arrivalTime: "09:50 AM",
              totalTime: "2h 30m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿89",
              context: context,
            ),
             _buildTravelCard(
              departureTime: "08.00 AM",
              arrivalTime: "10:30 AM",
              totalTime: "2h 30m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿89",
              context: context,
            ),
            _buildTravelCard(
              departureTime: "08.40 AM",
              arrivalTime: "11:10 AM",
              totalTime: "2h 30m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿89",
              context: context,
            ),
            _buildTravelCard(
              departureTime: "09.20 AM",
              arrivalTime: "11:50 AM",
              totalTime: "2h 30m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿89",
              context: context,
            ),
           _buildTravelCard(
              departureTime: "10.00 AM",
              arrivalTime: "12:30 PM",
              totalTime: "2h 30m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿89",
              context: context,
            ),
         _buildTravelCard(
              departureTime: "10.40 AM",
              arrivalTime: "01:10 PM",
              totalTime: "2h 30m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿89",
              context: context,
            ),
          _buildTravelCard(
              departureTime: "11.20 AM",
              arrivalTime: "01:50 PM",
              totalTime: "2h 30m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿89",
              context: context,
            ),
           _buildTravelCard(
              departureTime: "12.00 PM",
              arrivalTime: "02:30 PM",
              totalTime: "2h 30m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿89",
              context: context,
            ),
            _buildTravelCard(
              departureTime: "12.45 PM",
              arrivalTime: "03:15 PM",
              totalTime: "2h 30m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿89",
              context: context,
            ),
            _buildTravelCard(
              departureTime: "01.30 PM",
              arrivalTime: "06:00 PM",
              totalTime: "2h 30m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿89",
              context: context,
            ),
            _buildTravelCard(
              departureTime: "02.15 PM",
              arrivalTime: "06:45 PM",
              totalTime: "2h 30m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿89",
              context: context,
            ),
            _buildTravelCard(
              departureTime: "03.00 PM",
              arrivalTime: "05:30 PM",
              totalTime: "2h 30m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿89",
              context: context,
            ),
            _buildTravelCard(
              departureTime: "03.45 PM",
              arrivalTime: "06:15 PM",
              totalTime: "2h 30m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿89",
              context: context,
            ),
            _buildTravelCard(
              departureTime: "04.30 PM",
              arrivalTime: "07:00 PM",
              totalTime: "2h 30m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿89",
              context: context,
            ),
            _buildTravelCard(
              departureTime: "05.45 PM",
              arrivalTime: "08:00 PM",
              totalTime: "2h 30m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿89",
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTravelCard({
    required String departureTime,
    required String arrivalTime,
    required String totalTime,
    required String stops,
    required IconData flightIcon,
    required String price,
    required BuildContext context,
  }) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 159, 231, 234),
                  child: Icon(
                    flightIcon,
                    size: 28,
                    color: const Color.fromARGB(255, 5, 79, 163),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      departureTime,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "$totalTime · $stops",  // ใช้เวลารวมที่คำนวณไว้
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  arrivalTime,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            // ปุ่มที่ใช้แสดง popup อยู่ที่มุมขวาบนของการ์ด
            IconButton(
              icon: const Icon(Icons.info_outline, color: Color.fromARGB(209, 91, 9, 104)),
              onPressed: () {
                _showPopup(context, stops, "CRI ");
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showPopup(BuildContext context, String stops, String airportName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("ฺBus Stop "),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // เพื่อให้เนื้อหาดูเล็กลงใน Popup
            children: [
              Row(
                children: [
                  Icon(
                    Icons.directions_bus, // ไอคอนบัส
                    size: 20,
                    color: Colors.blue, // สีของไอคอน
                  ),
                  const SizedBox(width: 8), // ช่องว่างระหว่างไอคอนและข้อความ
                  Text("Stop 1: Mae Suai : 1h15m"),
                ],
              ),
              const SizedBox(height: 10), // ช่องว่างระหว่างบรรทัด
                Row(
                children: [
                  Icon(
                    Icons.directions_bus, // ไอคอนบัส
                    size: 20,
                    color: const Color.fromRGBO(33, 150, 243, 1), // สีของไอคอน
                  ),
                  const SizedBox(width: 8), // ช่องว่างระหว่างไอคอนและข้อความ
                  Text("Stop 2: Wiang Pa Pao : 2 hours"),
                ],
              ),
              const SizedBox(height: 10), // ช่องว่างระหว่างบรรทัด
               Row(
                children: [
                  Icon(
                    Icons.directions_bus, // ไอคอนบัส
                    size: 20,
                    color: const Color.fromRGBO(33, 150, 243, 1), // สีของไอคอน
                  ),
                  const SizedBox(width: 8), // ช่องว่างระหว่างไอคอนและข้อความ
                  Text("Stop 3: Mae Khachan "),
                ],
              ),
              const SizedBox(height: 10), // ช่องว่างระหว่างบรรทัด
              Row(
                children: [
                  Icon(
                    Icons.directions_bus, // ไอคอนบัส
                    size: 20,
                    color: Colors.blue, // สีของไอคอน
                  ),
                  const SizedBox(width: 8), // ช่องว่างระหว่างไอคอนและข้อความ
                  Text("Departure from:Busterminal1"), // ข้อความที่บอกข้อมูลสนามบิน
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop(); // ปิด dialog
              },
            ),
          ],
        );
      },
    );
  }
}
