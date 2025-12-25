import 'package:flutter/material.dart';

class MeetingDetailSheet extends StatefulWidget {
  final ScrollController? scrollController;
  const MeetingDetailSheet({super.key, this.scrollController});

  @override
  State<MeetingDetailSheet> createState() => _MeetingDetailSheetState();
}

class _MeetingDetailSheetState extends State<MeetingDetailSheet> with SingleTickerProviderStateMixin {
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
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           const SizedBox(height: 10),
          // Drag handle
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Pengantar User Interface Design",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          
          Expanded(
            child: CustomScrollView(
              controller: widget.scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Deskripsi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna dalam menggunakan produk secara baik. Pelajaran mengenai prinsip UID ini sudah pernah diajarkan dalam mata kuliah Implementasi Desain Antarmuka Pengguna tetap pada matakuliah ini akan direview kembali sehingga dapat menjadi bekal saat memasukki materi mengenai User Experience",
                          style: TextStyle(fontSize: 12, height: 1.5, color: Colors.black87),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _SliverTabBarDelegate(
                    TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.black,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      tabs: const [
                        Tab(text: "Lampiran Materi"),
                        Tab(text: "Tugas dan Kuis"),
                      ],
                    ),
                  ),
                  pinned: true,
                ),
                SliverFillRemaining(
                   child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildLampiranList(),
                      _buildEmptyState(),
                    ],
                   ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Placeholder for the illustration
          Image.asset(
            'assets/images/tugas_kuis.png',
            height: 200,
            width: 200,
          ),
          const SizedBox(height: 20),
          const Text(
            "Tidak Ada Tugas Dan Kuis Hari Ini",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 50), // Spacing to lift it up slightly
        ],
      ),
    );
  }

  Widget _buildLampiranList() {
    final List<Map<String, dynamic>> items = [
      {"icon": Icons.link, "title": "Zoom Meeting Syncronous", "checked": true},
      {"icon": Icons.description_outlined, "title": "Pengantar User Interface Design", "checked": true}, // Assuming grey check is handled by color logic or just checking
      {"icon": Icons.description_outlined, "title": "Empat Teori Dasar Antarmuka Pengguna", "checked": true},
      {"icon": Icons.description_outlined, "title": "Empat Teori Dasar Antarmuka Pengguna", "checked": true},
      {"icon": Icons.video_camera_back_outlined, "title": "User Interface Design for Beginner", "checked": true},
      {"icon": Icons.link, "title": "20 Prinsip Desain", "checked": true},
      {"icon": Icons.link, "title": "Best Practice UI Design", "checked": true},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        bool isGrey = index == 1 || index == 2; // Mimicking the visual where some checks might look different, or default to green. Image shows all grey except maybe one? Wait, image shows GREEN checks for all items except maybe the 2nd one which looks slightly different or just green. Actually they look mostly green in the provided image. Let's make them green.
        // Re-looking at iamge: It seems all are green checks.
        
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30), // Rounded pill shape
            border: Border.all(color: Colors.grey.shade200),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(item['icon'], size: 24, color: Colors.black87),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item['title'],
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(width: 8),
              if (item['checked'])
                 const Icon(Icons.check_circle, color: Color(0xFF2ECC71), size: 24),
            ],
          ),
        );
      },
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverTabBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.grey[50], // Background for sticky header
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
