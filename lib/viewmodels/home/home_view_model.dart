import 'package:flutter/material.dart';

import '../../models/news_articles_response.dart';
import '../../repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  String selectedCategory = 'latest';
  String selectedSort = 'New to Old';
  final TextEditingController searchController = TextEditingController();
  final List<String> categories = [
    'latest',
    'sports',
    'business',
    'entertainment'
  ];
  final List<String> sortBy = ['New to Old', 'Old to New'];
  List<Article> _newsArticles = [];
  bool _isLoading = false;
  final NewsRepository _newsRepository = NewsRepository();

  List<Article> get newsArticles => _newsArticles;

  bool get isLoading => _isLoading;

  void updateCategory(String newCategory) {
    selectedCategory = newCategory;
    notifyListeners();
  }

  void updateSort(String sortBy) {
    selectedSort = sortBy;
    notifyListeners();
  }

  Future<void> fetchNews({String query = '', String category = ''}) async {
    _isLoading = true;
    notifyListeners();
    try {
      _newsArticles =
          await _newsRepository.fetchNews(query: query, category: category);
      sortNewsByDate();
    } catch (e) {
      print('Error fetching news: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void sortNewsByDate() {
    _newsArticles.sort((a, b) {
      DateTime dateA = DateTime.parse(a.pubDate!);
      DateTime dateB = DateTime.parse(b.pubDate!);
      return selectedSort == 'Old to New'
          ? dateA.compareTo(dateB)
          : dateB.compareTo(dateA);
    });
    notifyListeners();
  }
}
