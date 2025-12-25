import 'package:flutter/material.dart';
import 'meeting_detail_sheet.dart';

class ClassDetailScreen extends StatefulWidget {
  final String title;
  final VoidCallback onBack;

  const ClassDetailScreen({
    super.key,
    required this.title,
    required this.onBack,
  });

  @override
  State<ClassDetailScreen> createState() => _ClassDetailScreenState();
}

class _ClassDetailScreenState extends State<ClassDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(),
          _buildTabBar(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildMateriTab(),
                _buildTugasTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ... (Header and TabBar methods are unchanged)

  // ... (Materi Tab methods are unchanged)

  Widget _buildTugasTab() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        _buildTaskItem(
          tag: "QUIZ",
          title: "Quiz Review 01",
          deadline: "26 Februari 2021 23:59 WIB",
          type: TaskType.quiz,
          isDone: true,
        ),
        _buildTaskItem(
          tag: "Tugas",
          title: "Tugas 01 - UID Android Mobile Game",
          deadline: "26 Februari 2021 23:59 WIB",
          type: TaskType.assignment,
          isDone: true,
          isGrey: true, // Grey checkmark for the second item based on image? Actually image shows grey check for second item.
        ),
        _buildTaskItem(
          tag: "Pertemuan 3",
          title: "Kuis - Assessment 2",
          deadline: "26 Februari 2021 23:59 WIB",
          type: TaskType.quiz,
          isDone: true,
        ),
      ],
    );
  }

  Widget _buildTaskItem({
    required String tag,
    required String title,
    required String deadline,
    required TaskType type,
    bool isDone = false,
    bool isGrey = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF5DADE2), // Light Blue
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (isDone)
                Icon(
                  Icons.check_circle,
                  color: isGrey ? Colors.grey : const Color(0xFF2ECC71), // Green vs Grey
                  size: 24,
                ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                type == TaskType.quiz ? Icons.quiz_outlined : Icons.assignment_outlined,
                size: 40,
                color: Colors.black,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Tenggat Waktu : $deadline",
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
      decoration: const BoxDecoration(
        color: Color(0xFFBC4B4B),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: widget.onBack,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      child: TabBar(
        controller: _tabController,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(color: Colors.grey, width: 3),
        ),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: const [
          Tab(text: "Materi"),
          Tab(text: "Tugas Dan Kuis"),
        ],
      ),
    );
  }

  Widget _buildMateriTab() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        _buildMeetingItem(
          meeting: "Pertemuan 1",
          title: "01 - Pengantar User Interface Design",
          subtitle: "3 URLs, 2 Files, 3 Interactive Content",
          isDone: true,
          isGrey: true,
          onTap: () {
            _showMeetingDetail(
              title: "Pengantar User Interface Design",
              description: "Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna dalam menggunakan produk secara baik. Pelajaran mengenai prinsip UID ini sudah pernah diajarkan dalam mata kuliah Implementasi Desain Antarmuka Pengguna tetap pada matakuliah ini akan direview kembali sehingga dapat menjadi bekal saat memasukki materi mengenai User Experience",
              attachments: [
                {"icon": Icons.link, "title": "Zoom Meeting Syncronous", "checked": true},
                {"icon": Icons.description_outlined, "title": "Pengantar User Interface Design", "checked": true},
                {"icon": Icons.description_outlined, "title": "Empat Teori Dasar Antarmuka Pengguna", "checked": true},
                {"icon": Icons.description_outlined, "title": "Empat Teori Dasar Antarmuka Pengguna", "checked": true},
                {"icon": Icons.video_camera_back_outlined, "title": "User Interface Design for Beginner", "checked": true},
                {"icon": Icons.link, "title": "20 Prinsip Desain", "checked": true},
                {"icon": Icons.link, "title": "Best Practice UI Design", "checked": true},
              ],
            );
          },
        ),
        _buildMeetingItem(
          meeting: "Pertemuan 2",
          title: "02 - Konsep User Interface Design",
          subtitle: "2 URLs, 1 Kuis, 3 Files, 1 Tugas",
          isDone: true,
          onTap: () {
            _showMeetingDetail(
              title: "Konsep User Interface Design",
              description: "Konsep dasar User Interface Design akan dipelajari bagaimana membangun sebuah Interaction Design pada antarmuka. Interaction ini sangat penting untuk aplikasi berkomunikasi dengan pengguna. Lalu dipelajari juga poin-poin penting pada interaction design seperti visibility, feedback, limitation, consistency dan affordance. Dan terakhir materi conceptual dan perceptual design interaction akan memberikan gambaran bagaimana bentuk dari Interaction.",
              attachments: [
                {"icon": Icons.link, "title": "Zoom Meeting Syncronous", "checked": true},
                {"icon": Icons.description_outlined, "title": "Elemen-elemen Antarmuka Pengguna", "checked": true},
                {"icon": Icons.description_outlined, "title": "UID Guidelines and Principles", "checked": true},
                {"icon": Icons.description_outlined, "title": "User Profile", "checked": true},
                {"icon": Icons.link, "title": "Principles of User Interface DesignURL", "checked": true},
              ],
            );
          },
        ),
        _buildMeetingItem(
          meeting: "Pertemuan 3",
          title: "03 - Interaksi pada User Interface Design",
          subtitle: "3 URLs, 2 Files, 3 Interactive Content",
          isDone: true,
        ),
        _buildMeetingItem(
          meeting: "Pertemuan 4",
          title: "04 - Ethnographic Observation",
          subtitle: "3 URLs, 2 Files, 3 Interactive Content",
          isDone: true,
        ),
        _buildMeetingItem(
          meeting: "Pertemuan 5",
          title: "05 - UID Testing",
          subtitle: "3 URLs, 2 Files, 3 Interactive Content",
          isDone: true,
        ),
        _buildMeetingItem(
          meeting: "Pertemuan 6",
          title: "06 - Assessment 1",
          subtitle: "3 URLs, 2 Files, 3 Interactive Content",
          isDone: true,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildMeetingItem({
    required String meeting,
    required String title,
    required String subtitle,
    bool isDone = false,
    bool isGrey = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5DADE2), // Light Blue
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    meeting,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (isDone)
                  Icon(
                    Icons.check_circle,
                    color: isGrey ? Colors.grey : const Color(0xFF2ECC71), // Green
                    size: 20,
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMeetingDetail({
    required String title,
    required String description,
    required List<Map<String, dynamic>> attachments,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, controller) {
          return MeetingDetailSheet(
            scrollController: controller,
            title: title,
            description: description,
            attachments: attachments,
          );
        },
      ),
    );
  }
}

enum TaskType { quiz, assignment }
