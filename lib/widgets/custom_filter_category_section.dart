import 'package:flutter/material.dart';

class FilterAndCategorySection extends StatelessWidget {
  const FilterAndCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final filterButtons = ['Filter', 'Ratings', 'Size', 'Color', 'Price'];
    final categories = [
      {'icon': Icons.backpack, 'label': 'Bags'},
      {'icon': Icons.account_balance_wallet, 'label': 'Wallets'},
      {'icon': Icons.directions_run, 'label': 'Footwear'},
      {'icon': Icons.checkroom, 'label': 'Clothes'},
      {'icon': Icons.watch, 'label': 'Watches'},
    ];

    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Filter buttons
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: filterButtons.map((text) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list, size: 16),
                  label: Text(text),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 12),

        // Category items
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final item = categories[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.shade200,
                      child: Icon(item['icon'] as IconData, size: 28),
                    ),
                    const SizedBox(height: 6),
                    Text(item['label'] as String),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }     
}
