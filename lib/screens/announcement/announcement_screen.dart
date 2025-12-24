import 'package:flutter/material.dart';
import 'package:learning_management/screens/announcement/announcement_detail_screen.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  int _selectedIndex = 0; // Default to Home or just a visual state

  void _onItemTapped(int index) {
    // Since this is a pushed screen, we might just want to pop back for Home
    // or navigate accordingly. For now, I'll keep it simple:
    // 0: Home -> Pop
    // Other tabs could replace the route or do nothing as this is a sub-screen.
    if (index == 0) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Pengumuman',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildAnnouncementItem(
            title: 'Maintenance Pra UAS Semester Genap 2020/2021',
            subtitle: 'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
          ),
          const SizedBox(height: 20),
          _buildAnnouncementItem(
            title: 'Pengumuman Maintance',
            subtitle: 'By Admin Celoe - Senin, 11 Januari 2021, 7:52',
          ),
          const SizedBox(height: 20),
          _buildAnnouncementItem(
            title: 'Maintenance Pra UAS Semeter Ganjil 2020/2021',
            subtitle: 'By Admin Celoe - Minggu, 10 Januari 2021, 9:30',
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
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
            // We don't really have a selected index valid for "Announcement" 
            // but usually it's accessed from Home, so typically no index is active 
            // or we mock one. The image shows Home is sort of highlighted? 
            // Actually in the image the Home icon is filled white, others outline.
            // But standard material bottom nav logic applies.
            currentIndex: 0, 
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

  Widget _buildAnnouncementItem({
    required String title,
    required String subtitle,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AnnouncementDetailScreen(),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.campaign, size: 40, color: Colors.black),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500, // Medium weight
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
