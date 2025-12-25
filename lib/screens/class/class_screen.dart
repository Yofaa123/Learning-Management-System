import 'package:flutter/material.dart';
import '../../widgets/class_progress_item.dart';

class ClassScreen extends StatefulWidget {
  final Function(String) onClassTap;
  final VoidCallback? onBack;

  const ClassScreen({
    super.key,
    required this.onClassTap,
    this.onBack,
  });

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (widget.onBack != null) {
              widget.onBack!();
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            children: [
              _buildClickableItem(
                'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA\nD4SM-42-03 [ADY]',
                '2021/2',
                80,
                'assets/images/desain.png',
              ),
              const SizedBox(height: 15),
              _buildClickableItem(
                'KEWARGANEGARAAN\nD4SM-41-GAB1 [BBO], JUMAT 2',
                '2021/2',
                65,
                'assets/images/kewarganegaraan.jpg',
              ),
              const SizedBox(height: 15),
              _buildClickableItem(
                'SISTEM OPERASI\nD4SM-44-02 [DDS]',
                '2021/2',
                50,
                'assets/images/sistem_operasi.png',
              ),
              const SizedBox(height: 15),
              _buildClickableItem(
                'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA\nD4SM-41-GAB1 [APJ]',
                '2021/2',
                50,
                'assets/images/pemrograman.jpg',
              ),
              const SizedBox(height: 15),
              _buildClickableItem(
                'BAHASA INGGRIS: BUSINES AND SCIENTIFIC\nD4SM-41-GAB1 [ARS]',
                '2021/2',
                50,
                'assets/images/inggris.jpg',
              ),
              const SizedBox(height: 15),
              _buildClickableItem(
                'PEMROGRAMAN MULTIMEDIA INTERAKTIF\nD4SM-43-04 [TPR]',
                '2021/2',
                50,
                'assets/images/multimedia.jpg',
              ),
              const SizedBox(height: 15),
              _buildClickableItem(
                'OLAH RAGA\nD3TT-44-02 [EYR]',
                '2021/2',
                50,
                'assets/images/olahraga.jpg',
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClickableItem(
      String title, String semester, int progress, String imagePath) {
    return GestureDetector(
      onTap: () => widget.onClassTap(title),
      child: ClassProgressItem(
        title: title,
        semester: semester,
        progress: progress,
        imagePath: imagePath,
      ),
    );
  }
}
