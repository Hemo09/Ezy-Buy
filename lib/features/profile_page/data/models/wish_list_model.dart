import 'package:flutter/material.dart';

class WishListModel with ChangeNotifier {
  String? id;
  String? wishListId;
  WishListModel({required this.id, required this.wishListId});
}
