import 'package:busbuddy/screen/favoritespage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'homepage.dart';
import 'welcome.dart';
import 'homepage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late GoogleMapController mapController;
  LatLng _currentPosition = const LatLng(20.02735, 99.89624); // พิกัดเริ่มต้น
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 1; // เริ่มต้นที่หน้า Search

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _searchLocation() async {
    String searchAddress = _searchController.text;
    if (searchAddress.isNotEmpty) {
      try {
        List<Location> locations = await locationFromAddress(searchAddress);
        if (locations.isNotEmpty) {
          _currentPosition = LatLng(locations.first.latitude, locations.first.longitude);
          mapController.animateCamera(CameraUpdate.newLatLng(_currentPosition));
          setState(() {});
        } else {
          _showSnackBar('Location not found');
        }
      } catch (e) {
        _showSnackBar('A search error occurred.');
      }
    } else {
      _showSnackBar('Please fill in your search information.');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _resetPosition() {
    setState(() {
      _currentPosition = const LatLng(20.02735, 99.89624); // รีเซ็ตพิกัดไปที่เริ่มต้น
    });
    mapController.animateCamera(CameraUpdate.newLatLng(_currentPosition));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // เปลี่ยนหน้าได้ตามที่ต้องการที่นี่
    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 1:
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SearchPage()));
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FavoritesPage()));
        break;
      case 3:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetPosition, // ปุ่มรีเซ็ตตำแหน่ง
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Searching...',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onSubmitted: (value) => _searchLocation(),
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentPosition,
                zoom: 14,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('searchLocation'),
                  position: _currentPosition,
                ),
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Like',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey
      ),
    );
  }
}
