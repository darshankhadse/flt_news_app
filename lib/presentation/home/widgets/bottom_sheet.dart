import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../viewmodels/home/home_view_model.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final newsViewModel = Provider.of<HomeViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Filter Options',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ExpansionTile(
            title: const Text('Sort By'),
            children: newsViewModel.sortBy.map((sortBy) {
              return RadioListTile<String>(
                title: Text(sortBy),
                value: sortBy,
                groupValue: newsViewModel.selectedSort,
                onChanged: (String? value) {
                  newsViewModel.updateSort(value!);
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              newsViewModel.sortNewsByDate();
              Navigator.pop(context);
            },
            child: const Text('Apply Filters'),
          ),
        ],
      ),
    );
  }
}
