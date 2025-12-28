import 'package:flutter/material.dart';

class QuizResultDetailScreen extends StatefulWidget {
  final Map<int, int> selectedAnswers;

  const QuizResultDetailScreen({
    super.key,
    required this.selectedAnswers,
  });

  @override
  State<QuizResultDetailScreen> createState() => _QuizResultDetailScreenState();
}

class _QuizResultDetailScreenState extends State<QuizResultDetailScreen> {
  int _currentQuestionIndex = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Radio button dapat digunakan untuk menentukan ?',
      'options': [
        'Jenis Kelamin',
        'Alamat',
        'Hobby',
        'Riwayat Pendidikan',
        'Umur',
      ],
      'correctIndex': 0,
    },
    {
      'question':
          'Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?',
      'options': [
        'Integrasi',
        'Standarisasi',
        'Konsistensi',
        'Koefensi',
        'Koreksi',
      ],
      'correctIndex': 2,
    },
    {
      'question':
          'Prinsip desain yang mengatur penempatan elemen visual untuk menciptakan keseimbangan dan kenyamanan mata adalah ?',
      'options': [
        'Alignment',
        'Contrast',
        'Repetition',
        'Proximity',
        'Balance',
      ],
      'correctIndex': 4,
    },
    {
      'question':
          'Warna yang paling cocok untuk tombol call-to-action (CTA) agar menarik perhatian pengguna adalah ?',
      'options': [
        'Abu-abu',
        'Biru tua',
        'Merah atau Orange',
        'Hijau muda',
        'Putih',
      ],
      'correctIndex': 2,
    },
    {
      'question':
          'Dalam typography, jarak vertikal antara baris teks disebut ?',
      'options': [
        'Kerning',
        'Leading (Line Height)',
        'Tracking',
        'Baseline',
        'X-height',
      ],
      'correctIndex': 1,
    },
    {
      'question':
          'Elemen UI yang digunakan untuk menampilkan beberapa pilihan dimana user dapat memilih lebih dari satu opsi adalah ?',
      'options': [
        'Radio Button',
        'Dropdown',
        'Checkbox',
        'Toggle Switch',
        'Slider',
      ],
      'correctIndex': 2,
    },
    {
      'question':
          'Metode penelitian yang melibatkan pengamatan langsung terhadap pengguna saat menggunakan produk adalah ?',
      'options': [
        'Survey',
        'A/B Testing',
        'Usability Testing',
        'Card Sorting',
        'Heuristic Evaluation',
      ],
      'correctIndex': 2,
    },
    {
      'question':
          'Aturan umum dalam desain yang menyatakan bahwa elemen visual harus diatur dalam kelompok ganjil (3, 5, 7) untuk menciptakan keseimbangan adalah ?',
      'options': [
        'Rule of Thirds',
        'Golden Ratio',
        'Rule of Odds',
        'Fibonacci Sequence',
        'Grid System',
      ],
      'correctIndex': 2,
    },
    {
      'question':
          'Hierarki visual dalam desain UI bertujuan untuk ?',
      'options': [
        'Mempercantik tampilan',
        'Menghemat ruang',
        'Mengurangi warna',
        'Memandu mata pengguna ke elemen penting',
        'Mengatur font',
      ],
      'correctIndex': 3,
    },
    {
      'question':
          'Dalam UX design, persona adalah ?',
      'options': [
        'Nama aplikasi',
        'Representasi fiktif dari target pengguna',
        'Jenis font',
        'Skema warna',
        'Template desain',
      ],
      'correctIndex': 1,
    },
    {
      'question':
          'Tools yang umum digunakan untuk membuat wireframe dan prototype adalah ?',
      'options': [
        'Photoshop',
        'Microsoft Word',
        'Figma atau Adobe XD',
        'PowerPoint',
        'Excel',
      ],
      'correctIndex': 2,
    },
    {
      'question':
          'Whitespace (ruang kosong) dalam desain UI berfungsi untuk ?',
      'options': [
        'Menghabiskan space',
        'Membuat desain terlihat kosong',
        'Meningkatkan keterbacaan dan fokus',
        'Menghemat biaya',
        'Mengurangi warna',
      ],
      'correctIndex': 2,
    },
    {
      'question':
          'Responsive design adalah konsep desain yang ?',
      'options': [
        'Hanya untuk desktop',
        'Hanya untuk mobile',
        'Menyesuaikan tampilan di berbagai ukuran layar',
        'Menggunakan satu ukuran untuk semua',
        'Tidak mempedulikan ukuran layar',
      ],
      'correctIndex': 2,
    },
    {
      'question':
          'Prinsip Gestalt yang menyatakan bahwa elemen yang berdekatan akan dipersepsikan sebagai satu kelompok adalah ?',
      'options': [
        'Similarity',
        'Proximity',
        'Closure',
        'Continuity',
        'Figure-Ground',
      ],
      'correctIndex': 1,
    },
    {
      'question':
          'WCAG (Web Content Accessibility Guidelines) adalah standar untuk ?',
      'options': [
        'Kecepatan website',
        'Aksesibilitas web untuk semua pengguna',
        'Desain grafis',
        'SEO optimization',
        'Database management',
      ],
      'correctIndex': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];
    final userSelection = widget.selectedAnswers[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFBC4B4B),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Quiz Review 1',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          _buildQuestionIndicators(),
          const SizedBox(height: 30),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              children: [
                Text(
                  'Soal Nomor ${_currentQuestionIndex + 1} / ${_questions.length}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  currentQuestion['question'] ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                ...List.generate(
                  currentQuestion['options'].length,
                  (index) => _buildAnswerOption(
                    index,
                    currentQuestion['options'][index],
                    userSelection == index,
                    currentQuestion['correctIndex'],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          _buildBottomButton(),
        ],
      ),
    );
  }

  Widget _buildQuestionIndicators() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        alignment: WrapAlignment.center,
        children: List.generate(_questions.length, (index) {
          final isCurrent = index == _currentQuestionIndex;
          final isCorrect = widget.selectedAnswers[index] == _questions[index]['correctIndex'];
          
          Color bgColor = isCorrect ? const Color(0xFF2ECC71) : const Color(0xFFED6C6C);
          Color textColor = Colors.white;

          return GestureDetector(
            onTap: () {
              setState(() {
                _currentQuestionIndex = index;
              });
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor,
                border: Border.all(
                  color: Colors.black,
                  width: isCurrent ? 2.5 : 1.0,
                ),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: isCurrent ? FontWeight.bold : FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildAnswerOption(int index, String text, bool isUserSelected, int correctIndex) {
    const letters = ['A', 'B', 'C', 'D', 'E'];
    
    // Default style
    Color backgroundColor = const Color(0xFFF8F9FA);
    Color textColor = Colors.black87;

    // Highlight logic
    if (index == correctIndex) {
      backgroundColor = const Color(0xFF2ECC71); // Green for correct answer
      textColor = Colors.white;
    } else if (isUserSelected) {
      backgroundColor = const Color(0xFFED6C6C); // Red for wrong user choice
      textColor = Colors.white;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Text(
            '${letters[index]}.  ',
            style: TextStyle(
              fontSize: 13,
              fontWeight: backgroundColor != const Color(0xFFF8F9FA) ? FontWeight.bold : FontWeight.w400,
              color: textColor,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                fontWeight: backgroundColor != const Color(0xFFF8F9FA) ? FontWeight.bold : FontWeight.w400,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Kembali ke halaman Quiz Review',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
