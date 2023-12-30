import 'package:ezy_buy/features/cart_page/data/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get getCartItem {
    return _cartItems;
  }

  bool isProductInCart({required String producId}) {
    return _cartItems.containsKey(producId);
  }

  void addCartItem({required String productId}) {
    _cartItems.putIfAbsent(
        productId,
        () =>
            CartModel(productId: productId, qty: 1, cartId: const Uuid().v4()));
    notifyListeners();
  }

  void updateQuantity({required String productId, required int quantity}) {
    _cartItems.update(
        productId,
        (product) => CartModel(
            productId: productId, qty: quantity, cartId: product.cartId));
    notifyListeners();
  }
}
