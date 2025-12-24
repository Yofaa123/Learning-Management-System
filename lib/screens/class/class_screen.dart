import 'package:flutter/material.dart';
import '../../widgets/class_progress_item.dart';
import '../notification/notification_screen.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  final int _selectedIndex = 1; // "Kelas Saya" is index 1

  void _onItemTapped(int index) {
    if (index == 0) {
      // Navigate back to Home
      Navigator.pop(context);
    } else if (index == 1) {
      // Already on Class Screen
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NotificationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Kelas Saya',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              ClassProgressItem(
                title:
                    'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA\nD4SM-42-03 [ADY]',
                semester: '2021/2',
                progress: 80,
                imagePath: 'assets/images/desain.png',
              ),
              const SizedBox(height: 15),
              ClassProgressItem(
                title: 'KEWARGANEGARAAN\nD4SM-41-GAB1 [BBO], JUMAT 2',
                semester: '2021/2',
                progress: 65,
                imagePath: 'assets/images/kewarganegaraan.jpg',
              ),
              const SizedBox(height: 15),
              ClassProgressItem(
                title: 'SISTEM OPERASI\nD4SM-44-02 [DDS]',
                semester: '2021/2',
                progress: 50,
                imagePath: 'assets/images/sistem_operasi.png',
              ),
              const SizedBox(height: 15),
              ClassProgressItem(
                title:
                    'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA\nD4SM-41-GAB1 [APJ]',
                semester: '2021/2',
                progress: 50,
                imagePath: 'assets/images/pemrograman.jpg',
              ),
              const SizedBox(height: 15),
              ClassProgressItem(
                title:
                    'BAHASA INGGRIS: BUSINES AND SCIENTIFIC\nD4SM-41-GAB1 [ARS]',
                semester: '2021/2',
                progress: 50,
                imagePath: 'assets/images/inggris.jpg',
              ),
              const SizedBox(height: 15),
              ClassProgressItem(
                title: 'PEMROGRAMAN MULTIMEDIA INTERAKTIF\nD4SM-43-04 [TPR]',
                semester: '2021/2',
                progress: 50,
                imagePath: 'assets/images/multimedia.jpg',
              ),
              const SizedBox(height: 15),
              ClassProgressItem(
                title: 'OLAH RAGA\nD3TT-44-02 [EYR]',
                semester: '2021/2',
                progress: 50,
                imagePath: 'assets/images/olahraga.jpg',
              ),
              const SizedBox(height: 80), // Space for bottom nav
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Kelas Saya',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifikasi',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            backgroundColor: const Color(0xFFBC4B4B),
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}
