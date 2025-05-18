import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEA6B8D), // Pink color for the AppBar
        title: const Text(
          "Data Kelompok",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFFEA6B8D), // Set the background color to pink
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildProfileCard(
              'assets/image/Foto Halim.jpg',
              'Satyagraha Halim',
              'NIM: 123220135',
            ),
            const SizedBox(height: 16),
            _buildProfileCard(
              'assets/image/Foto Intan.jpg',
              'Devi Intan Nurisma Putri',
              'NIM: 123220184',
            ),
            const SizedBox(height: 16),
            _buildProfileCard(
              'assets/image/Foto Zaim.jpg',
              'Zaim M Tsaqif Adinegara',
              'NIM: 123220200',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(String imagePath, String name, String nim) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(radius: 40, backgroundImage: AssetImage(imagePath)),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  nim,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
