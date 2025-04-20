import 'package:flutter/material.dart';

class NumTypes extends StatefulWidget {
  const NumTypes({super.key});

  @override
  State<NumTypes> createState() => _NumTypesState();
}

class _NumTypesState extends State<NumTypes> {
  final TextEditingController _controller = TextEditingController();
  String _hasil = '';

  bool isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  void cekJenisBilangan(String input) {
    setState(() {
      _hasil = '';
      double? nilai = double.tryParse(input);
      if (nilai == null) {
        _hasil = 'Input bukan angka!';
        return;
      }

      List<String> jenis = [];

      if (nilai % 1 == 0) {
        int bilangan = nilai.toInt();
        if (bilangan >= 0) jenis.add('Cacah');
        if (bilangan > 0) jenis.add('Bulat Positif');
        if (bilangan < 0) jenis.add('Bulat Negatif');
        if (isPrime(bilangan)) jenis.add('Prima');
      } else {
        jenis.add('Desimal');
      }

      _hasil = 'Jenis Bilangan:\n' + jenis.join(', ');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tipe Bilangan',
          style: TextStyle(fontFamily: 'Comic Sans MS'),
        ),
        backgroundColor: const Color(0xFFEA6B8D),
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5E1E1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Masukkan angka',
                  labelStyle: TextStyle(
                    fontFamily: 'Comic Sans MS',
                    color: Color(0xFF6D6875),
                  ),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEA6B8D),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () => cekJenisBilangan(_controller.text),
              child: const Text(
                'Cek Jenis Bilangan',
                style: TextStyle(fontFamily: 'Comic Sans MS'),
              ),
            ),
            const SizedBox(height: 24),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5E1E1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Text(
                _hasil,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Comic Sans MS',
                  color: Color(0xFF6D6875),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
