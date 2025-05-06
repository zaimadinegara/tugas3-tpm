import 'package:flutter/material.dart';
import 'web_recommendation_detail.dart';

class WebRecommendationPage extends StatefulWidget {
  const WebRecommendationPage({super.key});

  @override
  State<WebRecommendationPage> createState() => _WebRecommendationPageState();
}

class _WebRecommendationPageState extends State<WebRecommendationPage> {
  List<Map<String, dynamic>> recommendations = [
    {
      'title': 'Flutter Official Docs',
      'link': 'https://flutter.dev',
      'image':
          'https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
      'likes': 250,
    },
    {
      'title': 'Stack Overflow',
      'link': 'https://stackoverflow.com',
      'image':
          'https://cdn.sstatic.net/Sites/stackoverflow/company/img/logos/so/so-logo.png',
      'likes': 430,
    },
  ];

  void _incrementLikes(int index) {
    setState(() {
      recommendations[index]['likes'] += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rekomendasi Web"),
        backgroundColor: const Color(0xFFEA6B8D),
      ),
      body: ListView.builder(
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          final item = recommendations[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WebRecommendationDetailPage(item: item),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 5,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Image.network(
                      item['image'],
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                _incrementLikes(index);
                              },
                            ),
                            const SizedBox(width: 4),
                            Text('${item['likes']} likes'),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (_) => WebRecommendationDetailPage(
                                          item: item,
                                        ),
                                  ),
                                );
                              },
                              child: const Text('Kunjungi'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
