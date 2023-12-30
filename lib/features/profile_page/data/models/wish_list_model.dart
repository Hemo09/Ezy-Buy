import 'package:flutter/material.dart';

class WishListModel with ChangeNotifier {
  String? productId;
  String? wishListId;
  WishListModel({required this.productId, required this.wishListId});
}
