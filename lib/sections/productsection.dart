import 'package:flutter/material.dart';
import 'package:flutter_buoi5/models/shoe_model.dart';
import 'package:flutter_buoi5/widgets/custom_product_card.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final List<Shoe> products;

  const ProductSection({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: AspectRatio(
                  aspectRatio: 0.7,
                  child: CustomProductCard(shoe: products[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}