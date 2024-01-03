import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezy_buy/core/helper/function/app_fucntion.dart';
import 'package:ezy_buy/core/utils/constants.dart';
import 'package:ezy_buy/features/cart_page/data/models/cart_model.dart';
import 'package:ezy_buy/features/home_page/data/models/product_model.dart';
import 'package:ezy_buy/features/home_page/presenation/view_model/product_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  final usersDB = FirebaseFirestore.instance.collection("users");

  Future<void> addToCartFirebase(
      {required String productId,
      required int qty,
      required BuildContext context}) async {
    final User? user = AppFirebase.fireAuth.currentUser;
    if (user == null) {
      AppFunction.showWariningAlert(
          context: context, title: "No user found", press: () {});
      return;
    }
    final uid = user.uid;
    final cartId = const Uuid().v4();
    try {
      usersDB.doc(uid).update({
        'userCart': FieldValue.arrayUnion([
          {
            "cartId": cartId,
            'productId': productId,
            'quantity': qty,
          }
        ]),
      });
      await fetchCart();
      Fluttertoast.showToast(msg: "Item has been added to cart");
    } catch (e) {
      rethrow;
    }
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

  Future<void> fetchCart() async {
    User? user = AppFirebase.fireAuth.currentUser;
    if (user == null) {
      log("the function has been called and the user is null");
      _cartItems.clear();
      return;
    }
    try {
      final userDoc = await usersDB.doc(user.uid).get();
      final data = userDoc.data();
      if (data == null || !data.containsKey("userCart")) {
        return;
      }
      final leng = userDoc.get("userCart").length;
      for (int index = 0; index < leng; index++) {
        _cartItems.putIfAbsent(
          userDoc.get('userCart')[index]['productId'],
          () => CartModel(
            cartId: userDoc.get('userCart')[index]['cartId'],
            productId: userDoc.get('userCart')[index]['productId'],
            qty: userDoc.get('userCart')[index]['quantity'],
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> clearCartFromFirebase() async {
    User? user = AppFirebase.fireAuth.currentUser;
    try {
      await usersDB.doc(user!.uid).update({"userCart": []});
      _cartItems.clear();
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> removeCartItemFromFirebase(
      {required String cartId,
      required String productId,
      required int qty}) async {
    User? user = AppFirebase.fireAuth.currentUser;
    try {
      await usersDB.doc(user!.uid).update({
        "userCart": FieldValue.arrayRemove([
          {
            "cartId": cartId,
            'productId': productId,
            'quantity': qty,
          }
        ])
      });
      _cartItems.remove(productId);
      await fetchCart();
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }
}
