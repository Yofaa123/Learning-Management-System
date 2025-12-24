import 'package:flutter/material.dart';
import '../auth/login_screen.dart';
// import '../home/home_screen.dart'; // Cyclic import not strictly needed for pop but good for types if needed.
import '../class/class_screen.dart';
import '../notification/notification_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String namaUser;
  const ProfileScreen({super.key, required this.namaUser});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                // Red Background Header
                Container(
                  height: 300,
                  width: double.infinity,
                  color: const Color(0xFFBC4B4B),
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                // Profile Info
                Positioned(
                  top: 70,
                  child: Column(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.red.shade900,
                            width: 3,
                          ),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/profile.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        widget.namaUser.isEmpty
                            ? 'Pengguna'
                            : widget.namaUser.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Tab Card
                Container(
                  margin: const EdgeInsets.only(top: 260, left: 25, right: 25),
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTabItem("About Me", 0),
                      _buildTabItem("Kelas", 1),
                      _buildTabItem("Edit Profile", 2),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Tab Content
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              alignment: Alignment.centerLeft,
              child: _buildTabContent(),
            ),

            const SizedBox(height: 10),

            // Logout Button
            Padding(
              padding: const EdgeInsets.only(right: 30.0, bottom: 40.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff9e2a2b),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  icon: const Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ), // Using exit_to_app as logout icon replacement
                  label: const Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildTabItem(String title, int index) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          if (isSelected) Container(height: 3, width: 40, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    if (_selectedTabIndex == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Informasi User",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 20),
          _buildInfoItem(
            "Email address",
            "dandycandra@365.telkomuniversity.ac.id",
          ),
          _buildInfoItem("Program Studi", "D4 Teknologi Rekayasa Multimedia"),
          _buildInfoItem("Fakultas", "FIT"),
          const SizedBox(height: 30),
          const Text(
            "Aktivitas Login",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 20),
          _buildInfoItem(
            "First access to site",
            "Monday, 7 September 2020, 9:27 AM  (288 days 12 hours)",
          ),
          _buildInfoItem(
            "Last access to site",
            "Tuesday, 22 June 2021, 9:44 PM  (now)",
          ),
        ],
      );
    } else if (_selectedTabIndex == 1) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("Halaman Kelas Belum Tersedia"),
        ),
      );
    } else {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("Halaman Edit Profile Belum Tersedia"),
        ),
      );
    }
  }

  Widget _buildInfoItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFBC4B4B),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
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
          currentIndex: 0,
          selectedItemColor: Colors.white, // Active item
          unselectedItemColor: Colors.white70, // Inactive items
          backgroundColor: const Color(0xFFBC4B4B),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if (index == 0) {
              Navigator.pop(context); // Go back to Home
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ClassScreen()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
