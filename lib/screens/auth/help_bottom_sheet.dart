import 'package:flutter/material.dart';

class HelpBottomSheet extends StatefulWidget {
  const HelpBottomSheet({super.key});

  @override
  State<HelpBottomSheet> createState() => _HelpBottomSheetState();
}

class _HelpBottomSheetState extends State<HelpBottomSheet> {
  bool isIndonesian = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 16),
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Language Selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isIndonesian = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isIndonesian
                            ? const Color(0xFFBC4B4B)
                            : Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text('🇮🇩', style: TextStyle(fontSize: 18)),
                        const SizedBox(width: 4),
                        Text(
                          'ID',
                          style: TextStyle(
                            color: isIndonesian
                                ? const Color(0xFFBC4B4B)
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isIndonesian = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: !isIndonesian
                            ? const Color(0xFFBC4B4B)
                            : Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text('🇺🇸', style: TextStyle(fontSize: 18)),
                        const SizedBox(width: 4),
                        Text(
                          'EN',
                          style: TextStyle(
                            color: !isIndonesian
                                ? const Color(0xFFBC4B4B)
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: isIndonesian
                    ? _buildIndonesianContent()
                    : _buildEnglishContent(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildIndonesianContent() {
    return [
      const Text(
        'Akses aplikasi ini hanya untuk Dosen dan Mahasiswa Universitas Islam Madura.',
        style: TextStyle(fontSize: 16, height: 1.5),
      ),
      const SizedBox(height: 12),
      const Text(
        'Login menggunakan akun email terdaftar',
        style: TextStyle(fontSize: 16, height: 1.5),
      ),
      const SizedBox(height: 12),
      const Text(
        'Format username: fkteknik@gmail.com',
        style: TextStyle(
          fontSize: 16,
          height: 1.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 12),
      const Text(
        'Format password: 8 karakter',
        style: TextStyle(
          fontSize: 16,
          height: 1.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 12),
      const Text(
        'Jika login gagal:',
        style: TextStyle(
          fontSize: 16,
          height: 1.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Text(
        '- Pastikan akun sudah terdaftar Email Kampus',
        style: TextStyle(fontSize: 16, height: 1.5),
      ),
      const Text(
        '- Periksa koneksi internet',
        style: TextStyle(fontSize: 16, height: 1.5),
      ),
      const Text(
        '- Hubungi Admin Faklutas',
        style: TextStyle(fontSize: 16, height: 1.5),
      ),
      const SizedBox(height: 12),
      const Text(
        'Kontak Admin Fakultas:',
        style: TextStyle(
          fontSize: 16,
          height: 1.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Text(
        'Email: fkteknik@gmail.com',
        style: TextStyle(fontSize: 16, height: 1.5),
      ),
      const Text(
        'WhatsApp: 08123456789',
        style: TextStyle(fontSize: 16, height: 1.5),
      ),
      const SizedBox(height: 20),
    ];
  }

  List<Widget> _buildEnglishContent() {
    return [
      const Text(
        'Access to this application is only for Lecturers and Students of Universitas Islam Madura.',
        style: TextStyle(fontSize: 16, height: 1.5),
      ),
      const SizedBox(height: 12),
      const Text(
        'Login using a registered account.',
        style: TextStyle(fontSize: 16, height: 1.5),
      ),
      const SizedBox(height: 12),
      const Text(
        'Username format: fkteknik@gmail.com',
        style: TextStyle(
          fontSize: 16,
          height: 1.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 12),
      const Text(
        'Password format: 8 characters',
        style: TextStyle(
          fontSize: 16,
          height: 1.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 12),
      const Text(
        'If login fails:',
        style: TextStyle(
          fontSize: 16,
          height: 1.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Text(
        '- Make sure the account is registered with the campus email',
        style: TextStyle(fontSize: 16, height: 1.5),
      ),
      const Text(
        '- Check internet connection',
        style: TextStyle(fontSize: 16, height: 1.5),
      ),
      const Text('- Contact ', style: TextStyle(fontSize: 16, height: 1.5)),
      const SizedBox(height: 12),
      const Text(
        'engineering faculty contact:',
        style: TextStyle(
          fontSize: 16,
          height: 1.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Text(
        'Email: fkteknik@gmail.com',
        style: TextStyle(fontSize: 16, height: 1.5),
      ),
      const Text(
        'WhatsApp: 08123456789',
        style: TextStyle(fontSize: 16, height: 1.5),
      ),
      const SizedBox(height: 20),
    ];
  }
}
