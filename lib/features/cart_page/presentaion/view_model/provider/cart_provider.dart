import 'package:ezy_buy/features/cart_page/data/models/cart_model.dart';
import 'package:ezy_buy/features/home_page/data/models/product_model.dart';
import 'package:ezy_buy/features/home_page/presenation/view_model/product_provider.dart';
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

  double getToTal({required ProductProvider? productProvider}) {
    double tota = 0.0;
    _cartItems.forEach((key, value) {
      final ProductModel? getCurrentProduct =
          productProvider!.findById(value.productId!);
      if (getCurrentProduct == null) {
        tota += 0.0;
      } else {
        tota += double.parse(getCurrentProduct.productPrice) * value.qty!;
      }
    });
    return tota;
  }

  int getQty() {
    int total = 0;
    _cartItems.forEach((key, value) {
      total += value.qty!;
    });
    return total;
  }

  void removeOneProduct({required String productId}) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
