import 'package:flutter/material.dart';
import '../../widgets/class_progress_item.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
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
        automaticallyImplyLeading: false, // Remove automatic back button
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
              const SizedBox(height: 80), 
            ],
          ),
        ),
      ),
    );
  }
}
