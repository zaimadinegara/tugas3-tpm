import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';

class WebRecommendationDetailPage extends StatelessWidget {
  final Map<String, dynamic> item;

  const WebRecommendationDetailPage({super.key, required this.item});

  Future<void> openWeb(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Gagal membuka $url');
    }
  }

  void copyLink(String link) {
    Clipboard.setData(ClipboardData(text: link));
    Fluttertoast.showToast(
      msg: "Link disalin ke clipboard!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void shareLink(String link) {
    Share.share('Cek website ini: $link');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Web"),
        backgroundColor: const Color(0xFFEA6B8D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              item['image'],
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            Text(
              item['title'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              item['link'],
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => openWeb(item['link']),
              icon: const Icon(Icons.language),
              label: const Text('Buka Web'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEA6B8D),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () => copyLink(item['link']),
                  icon: const Icon(Icons.copy),
                  label: const Text('Copy Link'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () => shareLink(item['link']),
                  icon: const Icon(Icons.share),
                  label: const Text('Share'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
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
}
