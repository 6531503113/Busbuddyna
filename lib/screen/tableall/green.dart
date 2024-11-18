import 'package:busbuddy/screen/table.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const GreenPage());
}

class GreenPage extends StatelessWidget {
  const GreenPage({Key? key}) : super(key: key);

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
                "CHIANG RAI - MAE SAI",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // เปลี่ยนสีข้อความเป็นสีขาวเพื่อให้ชัดเจนขึ้น
                ),
                textAlign: TextAlign.center,
              ),
            ),
            _buildTravelCard(
              departureTime: "06.00 AM",
              arrivalTime: "08:10 AM",
              totalTime: "2h 10m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿79",
              context: context,
            ),
           _buildTravelCard(
              departureTime: "07.00 AM",
              arrivalTime: "09:10 AM",
              totalTime: "2h 10m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿79",
              context: context,
            ),
            _buildTravelCard(
              departureTime: "08.00 AM",
              arrivalTime: "10:10 AM",
              totalTime: "2h 10m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿79",
              context: context,
            ),
            _buildTravelCard(
              departureTime: "09.00 AM",
              arrivalTime: "11:10 AM",
              totalTime: "2h 10m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿79",
              context: context,
            ),
           _buildTravelCard(
              departureTime: "10.00 AM",
              arrivalTime: "12:10 PM",
              totalTime: "2h 10m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿79",
              context: context,
            ),
           _buildTravelCard(
              departureTime: "11.00 AM",
              arrivalTime: "01:10 PM",
              totalTime: "2h 10m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿79",
              context: context,
            ),
           _buildTravelCard(
              departureTime: "12.00 AM",
              arrivalTime: "02:10 PM",
              totalTime: "2h 10m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿79",
              context: context,
            ),
           _buildTravelCard(
              departureTime: "01.00 PM",
              arrivalTime: "03:10 PM",
              totalTime: "2h 10m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿79",
              context: context,
            ),
            _buildTravelCard(
              departureTime: "02.00 PM",
              arrivalTime: "04:10 PM",
              totalTime: "2h 10m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿79",
              context: context,
            ),
            _buildTravelCard(
              departureTime: "03.00 PM",
              arrivalTime: "05:10 PM",
              totalTime: "2h 10m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿79",
              context: context,
            ),
            _buildTravelCard(
              departureTime: "04.00 AM",
              arrivalTime: "06:10 PM",
              totalTime: "2h 10m",  // เวลารวม
              stops: "3 STOP",
              flightIcon: Icons.directions_bus, // ใช้ไอคอนรถโดยสาร
              price: "\฿79",
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
                  backgroundColor: const Color.fromARGB(255, 186, 248, 214),
                  child: Icon(
                    flightIcon,
                    size: 28,
                    color: const Color.fromARGB(255, 3, 63, 34),
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
                  Text("Stop 1: Ban DU :20-30 min"),
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
                  Text("Stop 2: MFU :30-40 min"),
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
                  Text("Stop 3: Mae Sai :1h 05m"),
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

