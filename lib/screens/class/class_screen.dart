import 'package:flutter/material.dart';

class ClassScreen extends StatelessWidget {
  const ClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelas Saya'),
        backgroundColor: const Color(0xFFBC4B4B),
      ),
      body: const Center(child: Text('Class Screen')),
    );
  }
}
