import 'package:flutter/material.dart';
import 'upload_assignment_sheet.dart';

class AssignmentDetailScreen extends StatefulWidget {
  const AssignmentDetailScreen({super.key});

  @override
  State<AssignmentDetailScreen> createState() => _AssignmentDetailScreenState();
}

class _AssignmentDetailScreenState extends State<AssignmentDetailScreen> {
  final List<String> _fileNames = ["Dandy Candra Pratama_7708170114.pdf"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFBC4B4B),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Tugas 01 - UID Android Mobile Game",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInstructionItem(
                      "1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan."),
                  const SizedBox(height: 16),
                  _buildInstructionItem(
                      "2. Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi dibuka sampai ditutup kembali, serta desain untuk tampilan-tampilan fungsi yang mendukung permainan seperti pop-up, alert, chat, dan lain-lain."),
                  const SizedBox(height: 16),
                  _buildInstructionItem(
                      "3. Desain bisa dibuat menggunakan aplikasi khusus desain atau secara manual dengan tetap menjunjung kerapihan dan kejelasan setiap elemen dalam desain."),
                  const SizedBox(height: 16),
                  _buildInstructionItem(
                      "4. Berikan identitas aplikasi game yang dibuat, seperti Nama Game, Genre, dan Platform. Serta berikan penjelasan pada setiap elemen pada desain, seperti gambar, teks, tombol, icon, dan lain-lain."),
                  const SizedBox(height: 16),
                  _buildInstructionItem(
                      "5. File dikumpulkan dalam format .PDF dengan size maksimal 5MB."),
                  const SizedBox(height: 16),
                  _buildInstructionItem(
                      "6. Tugas dikumpulkan paling lambat hari Jum'at, 26 Februari 2021 jam 23:59 WIB (akan tertutup otomatis) dan akan dipresentasikan pada pertemuan selanjutnya via Zoom Meeting."),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              color: const Color(0xFFE55B5B), // Slightly lighter red for the header
              child: const Text(
                "Status Tugas",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
             _buildStatusRow("Status", "Sudah Mengirim untuk di nilai", isGrey: true),
             _buildStatusRow("Status Nilai", "Belum Di nilai", isGrey: false),
             _buildStatusRow("Batas tanggal", "Jumat, 26 Februari 2021, 23:59 WIB", isGrey: true),
             _buildStatusRow("Sisa Waktu", "Tugas sudah di kirim 4 Hari 6 Jam Sebelum nya", isGrey: false),
             
             // Render all files
             ..._fileNames.asMap().entries.map((entry) {
               int idx = entry.key;
               String fileName = entry.value;
               // Continue alternating colors: 4 status rows (T, F, T, F) -> files start with grey (T) then (F)
               return _buildFileRow("File Tugas", fileName, isGrey: idx % 2 == 0);
             }).toList(),

             const SizedBox(height: 40),
             Center(
               child: Container(
                 margin: const EdgeInsets.only(bottom: 30),
                 child: ElevatedButton(
                   onPressed: () async {
                     final result = await showModalBottomSheet<String>(
                       context: context,
                       backgroundColor: Colors.transparent,
                       isScrollControlled: true,
                       builder: (context) => const UploadAssignmentSheet(),
                     );
                     
                     if (result != null) {
                       setState(() {
                         _fileNames.add(result);
                       });
                     }
                   },
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.grey[200],
                     foregroundColor: Colors.black,
                     elevation: 0,
                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(8),
                     ),
                   ),
                   child: const Text(
                     "Tambahkan Tugas",
                     style: TextStyle(fontWeight: FontWeight.w500),
                   ),
                 ),
               ),
             ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionItem(String text) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: const TextStyle(
        fontSize: 13,
        color: Colors.black87,
        height: 1.5,
      ),
    );
  }

  Widget _buildStatusRow(String label, String value, {required bool isGrey}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: isGrey ? Colors.grey[100] : Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFileRow(String label, String fileName, {required bool isGrey}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      color: isGrey ? Colors.grey[100] : Colors.white,
      child: Row(
         crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ),
          const Icon(Icons.description_outlined, size: 20, color: Colors.black54),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              fileName,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
