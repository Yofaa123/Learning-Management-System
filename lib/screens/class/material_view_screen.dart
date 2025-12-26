import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class MaterialViewScreen extends StatefulWidget {
  final String assetPath;
  final String title;

  const MaterialViewScreen({
    super.key,
    required this.assetPath,
    required this.title,
  });

  @override
  State<MaterialViewScreen> createState() => _MaterialViewScreenState();
}

class _MaterialViewScreenState extends State<MaterialViewScreen> {
  String? _localPath;
  int _totalPages = 0;
  int _currentPage = 0;
  bool _ready = false;
  String _errorMessage = '';

  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();

  @override
  void initState() {
    super.initState();
    _prepareFile();
  }

  Future<void> _prepareFile() async {
    try {
      final path = await _fromAsset(widget.assetPath, 'temp.pdf');
      setState(() {
        _localPath = path;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }

  Future<String> _fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage directory.
    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      return file.path;
    } catch (e) {
      throw Exception("Error parsing asset file!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBC4B4B),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        actions: [
          if (_ready)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "Halaman ${_currentPage + 1}/$_totalPages",
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
      body: _localPath != null
          ? Stack(
              children: [
                PDFView(
                  filePath: _localPath,
                  enableSwipe: true,
                  swipeHorizontal: false, // Vertical list of pages as per image might be better?
                  // Image shows vertical scrolling or horizontal? Usually vertical for lectures.
                  // Wait, image shows "Halaman 1/26" in top right. Usually implies pagination.
                  // I'll stick to default swipe logic but enableSwipe is true.
                  autoSpacing: true, // Like pages
                  pageFling: true,
                  pageSnap: true,
                  defaultPage: 0,
                  fitPolicy: FitPolicy.BOTH,
                  preventLinkNavigation: false,
                  onRender: (pages) {
                    setState(() {
                      _totalPages = pages!;
                      _ready = true;
                    });
                  },
                  onError: (error) {
                    setState(() {
                      _errorMessage = error.toString();
                    });
                  },
                  onPageError: (page, error) {
                    setState(() {
                      _errorMessage = '$page: ${error.toString()}';
                    });
                  },
                  onViewCreated: (PDFViewController pdfViewController) {
                    _controller.complete(pdfViewController);
                  },
                  onLinkHandler: (String? uri) {
                    // print('goto uri: $uri');
                  },
                  onPageChanged: (int? page, int? total) {
                    setState(() {
                      _currentPage = page!;
                    });
                  },
                ),
                if (!_ready)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                if (_errorMessage.isNotEmpty)
                  Center(
                    child: Text(_errorMessage),
                  )
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
