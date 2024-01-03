import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  String productTitle,
      productDescription,
      productPrice,
      productCategory,
      productImage,
      productQuantity,
      productId;
  Timestamp? createdAt;

  ProductModel({
    required this.productId,
    required this.productCategory,
    required this.productImage,
    required this.productDescription,
    required this.productPrice,
    required this.productQuantity,
    required this.productTitle,
    this.createdAt,
  });
  factory ProductModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ProductModel(
      productId: data['productId'],
      productTitle: data['productTitle'],
      productPrice: data['productPrice'],
      productCategory: data['productCategory'],
      productDescription: data['productDescription'],
      productImage: data['productImage'],
      productQuantity: data['productQuantity'],
      createdAt: data['createdAt'],
    );
  }
}
