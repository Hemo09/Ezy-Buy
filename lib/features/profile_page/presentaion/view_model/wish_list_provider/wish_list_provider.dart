import 'package:ezy_buy/features/cart_page/data/models/cart_model.dart';
import 'package:ezy_buy/features/home_page/data/models/product_model.dart';
import 'package:ezy_buy/features/home_page/presenation/view_model/product_provider.dart';
import 'package:ezy_buy/features/profile_page/data/models/wish_list_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class WishListProvider with ChangeNotifier {
  final Map<String, WishListModel> _wishListItems = {};
  Map<String, WishListModel> get getWishListItem {
    return _wishListItems;
  }

  bool isProductInCart({required String producId}) {
    return _wishListItems.containsKey(producId);
  }

  void addOrRemove({required String productId}) {
    if (isProductInCart(producId: productId)) {
      _wishListItems.remove(productId);
    } else {
      _wishListItems.putIfAbsent(
          productId,
          () => WishListModel(
              productId: productId, wishListId: const Uuid().v4()));
    }

    notifyListeners();
  }

  void clearCart() {
    _wishListItems.clear();
    notifyListeners();
  }
}
