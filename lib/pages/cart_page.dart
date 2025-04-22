import 'package:flutter/material.dart';
import 'package:flutter_buoi5/providers/cart_provider.dart';
import 'package:flutter_buoi5/widgets/custom_bottom_nav.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool selectAll = false;

  void _toggleSelectAll(CartProvider cartProvider) {
    setState(() {
      selectAll = !selectAll;
    });
    for (var shoe in cartProvider.cartItems) {
      shoe.isSelected = selectAll;
    }
  }

  void _confirmDeleteSelected(CartProvider cartProvider) async {
    final selectedItems =
        cartProvider.cartItems.where((e) => e.isSelected).toList();

    if (selectedItems.isEmpty) return;

    final confirm = await showDialog<bool>(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Xác nhận"),
            content: Text(
              "Bạn có muốn xoá ${selectedItems.length} sản phẩm không?",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text("Hủy"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text("Xoá"),
              ),
            ],
          ),
    );

    if (confirm == true) {
      cartProvider.removeSelectedItems();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Đã xoá các sản phẩm đã chọn")),
      );
    }
  }

 @override
  Widget build(BuildContext context) {
    return CustomBottomNavBar(
      currentIndex: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Cart Page",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            Consumer<CartProvider>(
              builder: (context, cartProvider, _) => IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _confirmDeleteSelected(cartProvider),
              ),
            ),
          ],
        ),
        body: Consumer<CartProvider>(
          builder: (context, cartProvider, _) {
            final cartItems = cartProvider.cartItems;
            if (cartItems.isEmpty) {
              return const Center(child: Text('Giỏ hàng đang trống'));
            }

            return Column(
              children: [
                CheckboxListTile(
                  value: selectAll,
                  onChanged: (_) => _toggleSelectAll(cartProvider),
                  title: const Text("Chọn tất cả"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final shoe = cartItems[index];
                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                value: shoe.isSelected,
                                activeColor: Colors.black,
                                onChanged: (value) {
                                  setState(() {
                                    shoe.isSelected = value!;
                                  });
                                },
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  shoe.imageUrl,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          title: Text(
                            shoe.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Giá: \$${shoe.price.toStringAsFixed(2)}'),
                              Text('Số lượng: ${shoe.quantity}'),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () =>
                                    cartProvider.decrementQuantity(shoe),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () =>
                                    cartProvider.incrementQuantity(shoe),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}