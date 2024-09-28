import 'package:flt_news_app/presentation/home/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../viewmodels/home/home_view_model.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final newsViewModel = Provider.of<HomeViewModel>(context);

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 12.0, top: 12.0),
            child: TextField(
              controller: newsViewModel.searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                hintText: 'Search for news...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    newsViewModel.fetchNews(
                      query: newsViewModel.searchController.text,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            _openFilterBottomSheet(context);
          },
          icon: const Icon(Icons.tune_rounded),
        ),
      ],
    );
  }

  void _openFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const CustomBottomSheet();
      },
    );
  }
}
