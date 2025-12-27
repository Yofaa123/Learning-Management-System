import 'package:flutter/material.dart';
import 'dart:async';
import 'quiz_summary_screen.dart';

class QuizTakingScreen extends StatefulWidget {
  final String quizTitle;
  final bool isReviewMode;
  final int initialIndex;

  const QuizTakingScreen({
    super.key,
    this.quizTitle = 'Quiz Review 1',
    this.isReviewMode = false,
    this.initialIndex = 0,
  });

  @override
  State<QuizTakingScreen> createState() => _QuizTakingScreenState();
}

class _QuizTakingScreenState extends State<QuizTakingScreen> {
  int _currentQuestionIndex = 0;
  Map<int, int> _selectedAnswers = {}; // questionIndex -> answerIndex (0-4)
  
  // Timer state
  late Timer _timer;
  int _remainingSeconds = 900; // 15 minutes = 900 seconds
  late DateTime _startTime;

  @override
  void initState() {
    super.initState();
    _currentQuestionIndex = widget.initialIndex;
    _startTime = DateTime.now();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
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
    },
  ];

  void _selectAnswer(int answerIndex) {
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.quizTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
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
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          
          // Question Number Indicators
          _buildQuestionIndicators(),
          
          const SizedBox(height: 20),
          
          // Question Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Question Number
                  Text(
                    'Soal Nomor ${_currentQuestionIndex + 1} / ${_questions.length}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Question Text
                  Text(
                    currentQuestion['question'],
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Answer Options
                  ...List.generate(
                    currentQuestion['options'].length,
                    (index) => _buildAnswerOption(
                      index,
                      currentQuestion['options'][index],
                      selectedAnswer == index,
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                ],
              ),
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: List.generate(_questions.length, (index) {
          final isAnswered = _selectedAnswers.containsKey(index);
          final isCurrent = index == _currentQuestionIndex;
          
          return Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.isReviewMode 
                  ? const Color(0xFF00FF00) // Bright Green for Review Mode
                  : (isAnswered ? const Color(0xFF2ECC71) : Colors.white),
              border: Border.all(
                color: isCurrent ? Colors.black : Colors.grey[400]!,
                width: isCurrent ? 2 : 1,
              ),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isCurrent ? FontWeight.bold : FontWeight.w500,
                  color: isAnswered ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildAnswerOption(int index, String text, bool isSelected) {
    const letters = ['A', 'B', 'C', 'D', 'E'];
    
    return GestureDetector(
      onTap: () => _selectAnswer(index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE57373) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(
              '${letters[index]}.  ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? Colors.white : Colors.black87,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.isReviewMode)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF5F5F5),
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Kembali Ke Halam Review',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          Row(
            children: [
              // Previous Button
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
              
              if (!isFirstQuestion && !isLastQuestion)
                const SizedBox(width: 12),
              
              // Next/Finish Button
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
        ],
      ),
    );
  }
}
