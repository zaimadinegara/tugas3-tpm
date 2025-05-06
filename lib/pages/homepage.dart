import 'package:flutter/material.dart';
import 'package:projektugas3/pages/lbs.dart';
import 'package:projektugas3/pages/numtypes.dart';
import 'package:projektugas3/pages/stopwatch.dart';
import 'package:projektugas3/pages/timeconvert.dart';
import 'package:projektugas3/pages/web_rekomendation.dart'; // ✅ Tambahkan ini
import '../util/local_storage.dart';
import 'loginpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) async {
    if (index == 2) {
      await LocalStorage.logout();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Main Menu',
          style: TextStyle(fontFamily: 'Comic Sans MS'),
        ),
        backgroundColor: const Color(0xFFEA6B8D),
        elevation: 4,
      ),
      body: _selectedIndex == 0 ? _buildMainMenu(context) : _buildHelpPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFFEA6B8D),
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFFF5E1E1),
        elevation: 10,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'Help',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
        ],
      ),
    );
  }

  Widget _buildMainMenu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
        children: [
          _buildMenuItem(
            context,
            icon: Icons.access_time,
            label: 'Konversi Waktu',
            destination: const TimeConvert(),
          ),
          _buildMenuItem(
            context,
            icon: Icons.my_location,
            label: 'Location Tracking',
            destination: const LBS(),
          ),
          _buildMenuItem(
            context,
            icon: Icons.numbers,
            label: 'Tipe Bilangan',
            destination: const NumTypes(),
          ),
          _buildMenuItem(
            context,
            icon: Icons.timer,
            label: 'Stopwatch',
            destination: const StopWatch(),
          ),
          _buildMenuItem(
            context,
            icon: Icons.web,
            label: 'Rekomendasi Web',
            destination: const WebRecommendationPage(), // ✅ Menu tambahan
          ),
        ],
      ),
    );
  }

  Widget _buildHelpPage() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Selamat datang di menu Help!\n\n'
          '1. Pilih fitur di Home untuk menggunakan aplikasi.\n'
          '2. Tekan Logout untuk keluar.\n\n'
          'Semoga membantu!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontFamily: 'Comic Sans MS'),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Widget destination,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: const Color(0xFFF5E1E1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.pink.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 500),
              child: Icon(icon, size: 60, color: const Color(0xFFEA6B8D)),
            ),
            const SizedBox(height: 8),
            AnimatedDefaultTextStyle(
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF6D6875),
                fontWeight: FontWeight.bold,
                fontFamily: 'Comic Sans MS',
              ),
              duration: const Duration(milliseconds: 300),
              child: Text(label, textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
