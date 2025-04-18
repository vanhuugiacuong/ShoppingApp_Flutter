import 'package:flutter/material.dart';
import 'package:flutter_buoi5/models/shoe_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartProvider with ChangeNotifier {
  final List<ShoeInCart> _cartItems = [];

  List<ShoeInCart> get cartItems => _cartItems;

  CartProvider() {
    _loadCart();
  }

  void addItem(ShoeInCart item) {
    final existedItem = _cartItems.firstWhere(
      (element) => element.id == item.id,
      orElse: () => ShoeInCart.defaultConstructor(),
    );
    if (existedItem.id.isNotEmpty) {
      existedItem.quantity++;
    } else {
      _cartItems.add(item);
    }
    _saveCart();
    notifyListeners();
  }

  void removeItem(ShoeInCart item) {
    _cartItems.removeWhere((element) => element.id == item.id);
    _saveCart();
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    _saveCart();
    notifyListeners();
  }

  void incrementQuantity(ShoeInCart shoe) {
    shoe.quantity++;
    _saveCart();
    notifyListeners();
  }

  void decrementQuantity(ShoeInCart shoe) {
    if (shoe.quantity > 1) {
      shoe.quantity--;
    } else {
      _cartItems.removeWhere((element) => element.id == shoe.id);
    }
    _saveCart();
    notifyListeners();
  }

  void toggleSelection(ShoeInCart shoe) {
    shoe.isSelected = !shoe.isSelected;
    notifyListeners();
  }

  void removeSelectedItems() {
    _cartItems.removeWhere((item) => item.isSelected);
    _saveCart();
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(
        0, (sum, item) => sum + (item.price * item.quantity));
  }

  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = _cartItems.map((item) => item.toJson()).toList();
    await prefs.setString('cart', jsonEncode(cartData));
  }

  Future<void> _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString('cart');
    if (cartString != null) {
      final List<ShoeInCart> cartData = (jsonDecode(cartString) as List)
          .map((item) => ShoeInCart.fromJson(item))
          .toList();
      _cartItems.addAll(cartData);
      notifyListeners();
    }
  }
}
