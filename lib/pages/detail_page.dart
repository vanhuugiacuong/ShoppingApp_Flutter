import 'package:flutter/material.dart';
import 'package:flutter_buoi5/models/shoe_model.dart';
import 'package:flutter_buoi5/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ShoeDetailPage extends StatelessWidget {
  final Shoe shoe;

  const ShoeDetailPage({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shoe.name),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Stack(
        children: [
          // Nội dung sản phẩm
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100), // để tránh che nội dung
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1.2,
                  child: Image.network(
                    shoe.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shoe.name,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${shoe.price.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 18, color: Colors.green),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Mô tả sản phẩm:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        shoe.description,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Nút tròn ở góc dưới
          Positioned(
            bottom: 20,
            left: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                final newShoe = ShoeInCart(
                  id: shoe.id,
                  name: shoe.name,
                  price: shoe.price,
                  imageUrl: shoe.imageUrl,
                  description: shoe.description,
                  quantity: 1,
                  isSelected: false,
                );
                Provider.of<CartProvider>(context, listen: false).addItem(newShoe);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${shoe.name} đã thêm vào giỏ hàng!'),
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
              child: const Icon(Icons.shopping_cart,color: Colors.white,),
            ),
          ),

          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              heroTag: 'wishlist',
              backgroundColor: Colors.redAccent,
              onPressed: () {
                // TODO: Xử lý wishlist
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${shoe.name} đã thêm vào wishlist!'),
                    duration: const Duration(seconds: 2),
                    backgroundColor: Colors.redAccent,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: const Icon(Icons.favorite_border,color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}
