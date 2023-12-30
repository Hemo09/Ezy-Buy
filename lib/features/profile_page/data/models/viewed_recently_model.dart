import 'package:flutter/material.dart';

class ViewedRecentlyModel with ChangeNotifier {
  String? productId;
  String? viewedId;
  ViewedRecentlyModel({required this.productId, required this.viewedId});
}
