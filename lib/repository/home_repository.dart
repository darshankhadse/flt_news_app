import 'dart:convert';

import 'package:flt_news_app/services/api_urls.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/news_articles_response.dart';
import '../services/network_service.dart';

class NewsRepository {
  static String get apiKey => dotenv.env['API_KEY']!;

  Future<List<Article>> fetchNews(
      {String query = '', String category = ''}) async {
    String endpoint = ApiUrls.latestNews;

    var queryParams = {
      'apikey': apiKey,
      'language': "en",
      if (query.isNotEmpty) 'q': query,
      if (category.isNotEmpty) 'category': category,
    };

    final response = await NetworkService().get(endpoint, queryParams);
    Map<String, dynamic> data = jsonDecode(response);
    NewsArticlesResponse newsArticle = NewsArticlesResponse.fromJson(data);
    return newsArticle.articles ?? [];
  }
}
