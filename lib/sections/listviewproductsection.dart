import 'package:flutter/material.dart';
import 'package:flutter_buoi5/models/shoe_model.dart';
import 'package:flutter_buoi5/widgets/custom_product_card.dart';

class Listviewproductsection extends StatelessWidget {
  final String title;
  final List<Shoe> products;

  const Listviewproductsection({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tiêu đề section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Lưới sản phẩm 2 cột không scroll
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.builder(
            itemCount: products.length,
            physics: const NeverScrollableScrollPhysics(), // Không scroll riêng
            shrinkWrap: true, // Cho phép co lại
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              return CustomProductCard(shoe: products[index]);
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
