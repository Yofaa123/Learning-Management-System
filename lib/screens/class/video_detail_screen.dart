import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetailScreen extends StatefulWidget {
  final String videoId;
  final String videoTitle;

  const VideoDetailScreen({
    super.key,
    required this.videoId,
    required this.videoTitle,
  });

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          widget.videoTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          // YouTube Player
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: const Color(0xFFBC4B4B),
            progressColors: const ProgressBarColors(
              playedColor: Color(0xFFBC4B4B),
              handleColor: Color(0xFFBC4B4B),
            ),
          ),
          
          // Video List Section
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text(
                  "Video Lain Nya",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                
                // Video 1 - Interaction Design
                _buildVideoItem(
                  thumbnailUrl: "https://img.youtube.com/vi/t-sOFhIbYlg/mqdefault.jpg",
                  title: "Interaction Design",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VideoDetailScreen(
                          videoId: "t-sOFhIbYlg",
                          videoTitle: "Interaction Design",
                        ),
                      ),
                    );
                  },
                ),
                
                // Video 2 - Pengantar Desain Antarmuka Pengguna
                _buildVideoItem(
                  thumbnailUrl: "https://img.youtube.com/vi/gXVFl6vG1lk/mqdefault.jpg",
                  title: "Pengantar Desain\nAntarmuka Pengguna",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VideoDetailScreen(
                          videoId: "gXVFl6vG1lk",
                          videoTitle: "Pengantar Desain Antarmuka Pengguna",
                        ),
                      ),
                    );
                  },
                ),
                
                // Video 3 - 4 Teori Dasar Desain Antarmuka Pengguna
                _buildVideoItem(
                  thumbnailUrl: "https://img.youtube.com/vi/0Ps0d4MkdyQ/mqdefault.jpg",
                  title: "4 Teori Dasar Desain\nAntarmuka Pengguna",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VideoDetailScreen(
                          videoId: "0Ps0d4MkdyQ",
                          videoTitle: "4 Teori Dasar Desain Antarmuka Pengguna",
                        ),
                      ),
                    );
                  },
                ),
                
                // Video 4 - Tutorial Dasar Figma
                _buildVideoItem(
                  thumbnailUrl: "https://img.youtube.com/vi/FTFaQWZBqQ8/mqdefault.jpg",
                  title: "Tutorial Dasar Figma -\nUI/UX Design Software",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VideoDetailScreen(
                          videoId: "FTFaQWZBqQ8",
                          videoTitle: "Tutorial Dasar Figma - UI/UX Design Software",
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoItem({
    required String thumbnailUrl,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                thumbnailUrl,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 120,
                    height: 80,
                    color: Colors.grey[300],
                    child: const Icon(Icons.video_library, size: 40),
                  );
                },
              ),
            ),
            const SizedBox(width: 15),
            // Title
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
