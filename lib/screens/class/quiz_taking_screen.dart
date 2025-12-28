import 'package:flutter/material.dart';
import 'dart:async';
import 'quiz_summary_screen.dart';

class QuizTakingScreen extends StatefulWidget {
  final String quizTitle;
  final bool isReviewMode;
  final int initialIndex;
  final Map<int, int>? initialAnswers;
  final bool showCorrectAnswers;

  const QuizTakingScreen({
    super.key,
    required this.quizTitle,
    this.isReviewMode = false,
    this.initialIndex = 0,
    this.initialAnswers,
    this.showCorrectAnswers = false,
  });

  @override
  State<QuizTakingScreen> createState() => _QuizTakingScreenState();
}

class _QuizTakingScreenState extends State<QuizTakingScreen> {
  int _currentQuestionIndex = 0;
  Map<int, int> _selectedAnswers = {}; // questionIndex -> answerIndex (0-4)
  
  // Timer state
  Timer? _timer;
  int _remainingSeconds = 900; // 15 minutes = 900 seconds
  late DateTime _startTime;

  @override
  void initState() {
    super.initState();
    _currentQuestionIndex = widget.initialIndex;
    if (widget.initialAnswers != null) {
      _selectedAnswers = Map<int, int>.from(widget.initialAnswers!);
    }
    _startTime = DateTime.now();
    if (!widget.isReviewMode) {
      _startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
        // Timer reached 0 - could show dialog or auto-submit
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  // Quiz questions data
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

  void _selectAnswer(int answerIndex) {
    if (widget.isReviewMode) return; // Disable in review mode
    setState(() {
      _selectedAnswers[_currentQuestionIndex] = answerIndex;
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  void _previousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  void _finishQuiz() {
    final timeSpent = DateTime.now().difference(_startTime).inSeconds;
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizSummaryScreen(
          quizTitle: widget.quizTitle,
          questions: _questions,
          selectedAnswers: _selectedAnswers,
          timeSpentSeconds: timeSpent,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];
    final selectedAnswer = _selectedAnswers[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFBC4B4B),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: widget.isReviewMode 
          ? null 
          : IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
        centerTitle: true,
        title: Text(
          widget.isReviewMode ? 'Quiz Review 1' : widget.quizTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          if (!widget.isReviewMode)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.white, size: 20),
                  const SizedBox(width: 6),
                  Text(
                    _formatTime(_remainingSeconds),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          if (widget.isReviewMode)
             Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.white, size: 30),
                  const SizedBox(width: 8),
                  const Text(
                    "15 : 00",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          
          _buildQuestionIndicators(),
          
          const SizedBox(height: 30),
          
          // Question Content
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
                    selectedAnswer == index,
                    currentQuestion['correctIndex'],
                  ),
                ),
                
                const SizedBox(height: 30),
              ],
            ),
          ),
          
          // Navigation Buttons
          _buildNavigationButtons(),
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
          
          Color bgColor = const Color(0xFF2ECC71); // Default for review mode as per Gambar 2
          Color textColor = Colors.white;
          Color borderColor = Colors.black;

          if (!widget.isReviewMode) {
             final isAnswered = _selectedAnswers.containsKey(index);
             bgColor = isAnswered ? const Color(0xFF2ECC71) : Colors.white;
             textColor = isAnswered ? Colors.white : Colors.black;
          }

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
                  color: borderColor,
                  width: isCurrent ? 2.2 : 1.0,
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

  Widget _buildAnswerOption(int index, String text, bool isSelected, int? correctIndex) {
    const letters = ['A', 'B', 'C', 'D', 'E'];
    
    Color backgroundColor = const Color(0xFFF8F9FA);
    Color textColor = Colors.black87;

    if (widget.isReviewMode) {
      if (isSelected) {
        backgroundColor = const Color(0xFFED6C6C); // Red highlight from design
        textColor = Colors.black;
      }
    } else if (isSelected) {
      backgroundColor = const Color(0xFFBC4B4B); // Red for Active Selection
      textColor = Colors.white;
    }
    
    return GestureDetector(
      onTap: () => _selectAnswer(index),
      child: Container(
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
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    final isLastQuestion = _currentQuestionIndex == _questions.length - 1;
    final isFirstQuestion = _currentQuestionIndex == 0;

    // --- REVIEW MODE NAVIGATION ---
    if (widget.isReviewMode) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Center(
          child: _buildPillButton('Kembali Ke Halam Review', () => Navigator.pop(context)),
        ),
      );
    }

    // --- NORMAL MODE NAVIGATION ---
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (!isFirstQuestion)
            Expanded(
              child: OutlinedButton(
                onPressed: _previousQuestion,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: BorderSide(color: Colors.grey[400]!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Soal Sebelumnya',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          if (!isFirstQuestion) const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: isLastQuestion ? _finishQuiz : _nextQuestion,
              style: ElevatedButton.styleFrom(
                backgroundColor: isLastQuestion ? const Color(0xFF2ECC71) : Colors.grey[400],
                foregroundColor: isLastQuestion ? Colors.white : Colors.black87,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                isLastQuestion ? 'Selesai' : 'Soal Selanjutnya',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPillButton(String text, VoidCallback onPressed) {
    return Container(
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
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
