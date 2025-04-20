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
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shadowColor: const Color.fromARGB(255, 144, 143, 143),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hình ảnh
          // Hình ảnh sản phẩm
          AspectRatio(
            aspectRatio: 1.2,
            child: Image.network(
              widget.shoe.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Tên và giá sản phẩm
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.shoe.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text('\$${widget.shoe.price.toStringAsFixed(2)}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        final newShoe = ShoeInCart(
                          id: widget.shoe.id,
                          name: widget.shoe.name,
                          price: widget.shoe.price,
                          imageUrl: widget.shoe.imageUrl,
                          description: widget.shoe.description,
                          quantity: 1,
                          isSelected: false,
                        );
                        Provider.of<CartProvider>(
                          context,
                          listen: false,
                        ).addItem(newShoe);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${widget.shoe.name} đã thêm vào giỏ hàng!',
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
                      icon: const Icon(Icons.shopping_cart),
                    ),
                    IconButton(
                      onPressed: (){
                      },
                      icon: const Icon(Icons.more_vert))
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
