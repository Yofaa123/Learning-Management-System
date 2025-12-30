import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

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
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
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
          // YouTube Player - Platform Specific
          if (kIsWeb)
            // Web: Show thumbnail with play button that opens YouTube
            _buildWebVideoPlayer()
          else
            // Mobile: Show actual YouTube player
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
                  "Video Lainnya",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),

                // Video 1 - Interaction Design
                _buildVideoItem(
                  thumbnailUrl:
                      "https://img.youtube.com/vi/U7rS_2ch_Ps/mqdefault.jpg",
                  title: "Interaction Design",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VideoDetailScreen(
                          videoId: "U7rS_2ch_Ps",
                          videoTitle: "Interaction Design",
                        ),
                      ),
                    );
                  },
                ),

                // Video 2 - Pengantar Desain Antarmuka Pengguna
                _buildVideoItem(
                  thumbnailUrl:
                      "https://img.youtube.com/vi/oWI02NbZnaE/mqdefault.jpg",
                  title: "Pengantar Desain\nAntarmuka Pengguna",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VideoDetailScreen(
                          videoId: "oWI02NbZnaE",
                          videoTitle: "Pengantar Desain Antarmuka Pengguna",
                        ),
                      ),
                    );
                  },
                ),

                // Video 3 - 4 Teori Dasar Desain Antarmuka Pengguna
                _buildVideoItem(
                  thumbnailUrl:
                      "https://img.youtube.com/vi/Zo-j_FTKBow/mqdefault.jpg",
                  title: "4 Teori Dasar Desain\nAntarmuka Pengguna",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VideoDetailScreen(
                          videoId: "Zo-j_FTKBow",
                          videoTitle: "4 Teori Dasar Desain Antarmuka Pengguna",
                        ),
                      ),
                    );
                  },
                ),

                // Video 4 - Tutorial Dasar Figma
                _buildVideoItem(
                  thumbnailUrl:
                      "https://img.youtube.com/vi/FTFaQWZBqQ8/mqdefault.jpg",
                  title: "Tutorial Dasar Figma -\nUI/UX Design Software",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VideoDetailScreen(
                          videoId: "FTFaQWZBqQ8",
                          videoTitle:
                              "Tutorial Dasar Figma - UI/UX Design Software",
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
              child: CachedNetworkImage(
                imageUrl: thumbnailUrl,
                width: 120,
                height: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 120,
                  height: 80,
                  color: Colors.grey[300],
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFFBC4B4B),
                      ),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 120,
                  height: 80,
                  color: Colors.grey[300],
                  child: const Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.play_circle_outline,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
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

  // Web Video Player - Shows thumbnail with play button
  Widget _buildWebVideoPlayer() {
    final thumbnailUrl =
        "https://img.youtube.com/vi/${widget.videoId}/maxresdefault.jpg";

    return GestureDetector(
      onTap: () => _openYouTubeInBrowser(widget.videoId),
      child: Container(
        width: double.infinity,
        height: 220,
        color: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Thumbnail
            CachedNetworkImage(
              imageUrl: thumbnailUrl,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.black,
                child: const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFFBC4B4B),
                    ),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.black,
                child: const Center(
                  child: Icon(
                    Icons.video_library,
                    size: 80,
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
            // Play button overlay
            Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFBC4B4B),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Klik untuk buka di YouTube',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Open YouTube video in browser
  Future<void> _openYouTubeInBrowser(String videoId) async {
    final url = Uri.parse('https://www.youtube.com/watch?v=$videoId');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tidak bisa membuka YouTube'),
            backgroundColor: Color(0xFFBC4B4B),
          ),
        );
      }
    }
  }
}
