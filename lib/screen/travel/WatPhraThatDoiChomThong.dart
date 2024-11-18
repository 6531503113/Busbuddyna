import 'package:flutter/material.dart';

class  WatPhraThatDoiChomThongPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wat Phra That Doi Chom Thong, Chiang Rai'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image of Wat Tham Pla
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/WatPhraThatDoiChomThong.jpg', // Add the image path here
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Title
              const Text(
                'Wat Tham Pla (Fish Cave Temple)',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 10),

              // Description
              const Text(
                '''Wat Tham Pla, also known as the Fish Cave Temple, is a serene and unique Buddhist temple located in the forests of Chiang Rai, Thailand. The temple is famous for its cave and the many fish that inhabit the stream flowing through it. The fish are considered sacred by locals, and visitors are encouraged to feed them as part of the spiritual experience.

The temple itself is nestled within a lush forest, offering a peaceful and tranquil atmosphere. It features a beautiful cave temple, a large Buddha statue, and various other statues and shrines that attract both locals and tourists alike. Wat Tham Pla is a perfect spot for those looking for a quiet place to meditate, connect with nature, and experience Thai spirituality.''',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),

              // Additional Information
              const Text(
                'Location: Chiang Rai, Thailand\nOpening Hours: 8:00 AM - 5:00 PM\nEntry Fee: Free (donations welcome)\n',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WatPhraThatDoiChomThongPage(),
  ));
}
