import 'package:flutter/material.dart';
import 'package:busbuddy/screen/table.dart';
import 'package:busbuddy/screen/homepage.dart';
import 'package:busbuddy/screen/welcome.dart';

class LightgreenPage extends StatefulWidget {
  const LightgreenPage({super.key});

  @override
  _LightgreenPageState createState() => _LightgreenPageState();
}

class _LightgreenPageState extends State<LightgreenPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
        break;
      case 1:
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ตารางข้อมูล'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TablePage()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 30,
            headingRowHeight: 56,
            dataRowHeight: 60,
            columns: const [
              DataColumn(
                label: Text(
                  'เวลามา',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
              ),
              DataColumn(
                label: Text(
                  'เวลาออก',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
              ),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('7.30', style: TextStyle(fontSize: 16))),
                DataCell(Text('8.00', style: TextStyle(fontSize: 16))),
              ]),
              DataRow(cells: [
                DataCell(Text('8.00', style: TextStyle(fontSize: 16))),
                DataCell(Text('8.30', style: TextStyle(fontSize: 16))),
              ]),
              DataRow(cells: [
                DataCell(Text('8.30', style: TextStyle(fontSize: 16))),
                DataCell(Text('9.00', style: TextStyle(fontSize: 16))),
              ]),
              DataRow(cells: [
                DataCell(Text('9.00', style: TextStyle(fontSize: 16))),
                DataCell(Text('9.30', style: TextStyle(fontSize: 16))),
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'Table',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   label: 'Profile',
          // ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
      ),
    );
  }
}
