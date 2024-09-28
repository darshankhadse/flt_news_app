import 'package:flutter/material.dart';
import '../../../models/news_articles_response.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      margin: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (article.imageUrl != null && article.imageUrl!.isNotEmpty)
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                article.imageUrl!,
                fit: BoxFit.fitWidth,
                width: double.infinity,
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Fallback color
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Image not available',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  );
                },
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.description != null && article.description!.isNotEmpty
                    ? (article.description!.length > 120
                        ? '${article.description!.substring(0, 120)}...'
                        : article.description!)
                    : 'No description available',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article.title ?? 'No title available',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
