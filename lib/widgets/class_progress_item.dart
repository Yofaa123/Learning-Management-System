import 'package:flutter/material.dart';

class ClassProgressItem extends StatelessWidget {
  final String title;
  final String semester;
  final int progress;
  final String imagePath;

  const ClassProgressItem({
    super.key,
    required this.title,
    required this.semester,
    required this.progress,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.image, color: Colors.grey, size: 30),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                semester,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              LinearProgressIndicator(
                value: progress / 100,
                backgroundColor: Colors.grey[300],
                color: const Color(0xFFBC4B4B),
                minHeight: 5,
              ),
              const SizedBox(height: 2),
              Text(
                '$progress% Selesai',
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
