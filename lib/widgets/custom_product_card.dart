import 'package:flutter/material.dart';
import 'package:flutter_buoi5/models/shoe_model.dart';
import 'package:flutter_buoi5/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CustomProductCard extends StatefulWidget {
  const CustomProductCard({super.key, required this.shoe});

  final Shoe shoe;

  @override
  State<CustomProductCard> createState() => _CustomProductCardState();
}

class _CustomProductCardState extends State<CustomProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // nền đen
      // shadowColor: Colors.greenAccent.withOpacity(1),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 30,
      shadowColor: const Color.fromARGB(255, 218, 218, 218),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: Image.network(
                widget.shoe.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.shoe.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              '\$${widget.shoe.price.toStringAsFixed(2)}',
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.shoe.description,
              style: TextStyle(color: Colors.grey[600]),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Xử lý "View Details" nếu có
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF1DB954), // Màu viền & chữ
                    side: const BorderSide(color: Color(0xFF1DB954), width: 2),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  child: const Text('View Details'),
                ),
                const SizedBox(width: 10),
                FilledButton.icon(
                  icon: const Icon(Icons.add_shopping_cart),
                  label: const Text("Cart"),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF1DB954), // Spotify green
                    foregroundColor: Colors.white, // icon + text color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    final newShoe = ShoeInCart(
                      id: widget.shoe.id,
                      name: widget.shoe.name,
                      price: widget.shoe.price,
                      imageUrl: widget.shoe.imageUrl,
                      description: widget.shoe.description,
                    );
                    Provider.of<CartProvider>(
                      context,
                      listen: false,
                    ).addItem(newShoe);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${widget.shoe.name} đã được thêm vào giỏ hàng!',
                        ),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.green[600],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
