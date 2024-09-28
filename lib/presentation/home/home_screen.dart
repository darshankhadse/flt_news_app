import 'package:flt_news_app/presentation/home/widgets/category_chips.dart';
import 'package:flt_news_app/presentation/home/widgets/search_bar.dart';
import 'package:flt_news_app/viewmodels/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/news_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeViewModel>(context, listen: false).fetchNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final newsViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Text('News App'),
      ),
      body: Column(
        children: [
          const CustomSearchBar(),
          const CategoryChips(),
          Expanded(
            child: newsViewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: newsViewModel.newsArticles.length,
                    itemBuilder: (context, index) {
                      return NewsCard(
                        article: newsViewModel.newsArticles[index],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
