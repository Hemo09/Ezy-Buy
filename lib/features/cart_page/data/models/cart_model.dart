import 'package:flutter/material.dart';

class CartModel with ChangeNotifier {
  String? productId;
  int? qty;
  String? cartId;
  CartModel({required this.productId, required this.qty, required this.cartId});
}
