import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/home/home_view_model.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    final newsViewModel = Provider.of<HomeViewModel>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
        child: Row(
          children: newsViewModel.categories.map((category) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ChoiceChip(
                backgroundColor: Colors.white,
                checkmarkColor: Colors.greenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                label: Text(category),
                selected: newsViewModel.selectedCategory == category,
                onSelected: (bool selected) {
                  newsViewModel.updateCategory(selected ? category : '');
                  newsViewModel.fetchNews(
                    category: category == 'latest' ? '' : category,
                  );
                },
                selectedColor: Colors.blueAccent,
                labelStyle: TextStyle(
                  color: newsViewModel.selectedCategory == category
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
