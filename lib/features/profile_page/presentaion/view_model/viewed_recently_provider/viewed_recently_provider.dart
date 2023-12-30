import 'package:ezy_buy/features/profile_page/data/models/viewed_recently_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ViewedRecentlyProvider with ChangeNotifier {
  final Map<String, ViewedRecentlyModel> _viewedRecntlyItems = {};
  Map<String, ViewedRecentlyModel> get getViewedRecntlyListItem {
    return _viewedRecntlyItems;
  }

  bool isProductInCart({required String producId}) {
    return _viewedRecntlyItems.containsKey(producId);
  }

  void addOrRemove({required String productId}) {
    _viewedRecntlyItems.putIfAbsent(
        productId,
        () => ViewedRecentlyModel(
            productId: productId, viewedId: const Uuid().v4()));

    notifyListeners();
  }

  void clearCart() {
    _viewedRecntlyItems.clear();
    notifyListeners();
  }
}
