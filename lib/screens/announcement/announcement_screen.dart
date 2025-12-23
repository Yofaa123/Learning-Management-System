import 'package:flutter/material.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengumuman'),
        backgroundColor: const Color(0xFFBC4B4B),
      ),
      body: const Center(
        child: Text('Announcement Screen'),
      ),
    );
  }
}
