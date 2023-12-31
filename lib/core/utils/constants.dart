import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:ezy_buy/features/home_page/data/models/cateogy_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AppColor {
  static const Color lightScaffoldColor = Colors.white;
  static const Color lightPrimary = Color(0xFF181059);
  static const Color lightCardColor = Color.fromARGB(106, 250, 250, 250);
  static const Color darkScaffoldColor = Color.fromARGB(255, 9, 3, 27);
  static const Color darkPrimary = Color.fromARGB(255, 94, 75, 236);
  static const Color darkCardColor = Color.fromARGB(255, 13, 6, 37);
}

class AppConstants {
  static List banners = [
    AppImages.banner1,
    AppImages.banner2,
  ];
  static List<CategoryModel> categoriesNamed = [
    CategoryModel(
        id: AppImages.cosmetics,
        image: AppImages.cosmetics,
        name: "Accessories"),
    CategoryModel(id: AppImages.book, image: AppImages.book, name: "book"),
    CategoryModel(
        id: AppImages.electronics,
        image: AppImages.electronics,
        name: "electronics"),
    CategoryModel(
        id: AppImages.fashion, image: AppImages.fashion, name: "fashion"),
    CategoryModel(
        id: AppImages.mobiles, image: AppImages.mobiles, name: "phones"),
    CategoryModel(id: AppImages.pc, image: AppImages.pc, name: "Laptops"),
    CategoryModel(id: AppImages.shoes, image: AppImages.shoes, name: "Shoes"),
    CategoryModel(id: AppImages.watch, image: AppImages.watch, name: "Watches"),
  ];
}

class AppFirebase {
  //firebase

  static FirebaseAuth fireAuth = FirebaseAuth.instance;
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;
  static FirebaseStorage fireStorage = FirebaseStorage.instance;
}
