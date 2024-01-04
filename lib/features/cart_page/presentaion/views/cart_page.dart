import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezy_buy/core/helper/function/app_fucntion.dart';
import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:ezy_buy/features/auth_pages/presenation/view_model/user_provider.dart';
import 'package:ezy_buy/features/cart_page/presentaion/view_model/provider/cart_provider.dart';
import 'package:ezy_buy/features/cart_page/presentaion/views/widgets/bottom_cart_page.dart';
import 'package:ezy_buy/features/cart_page/presentaion/views/widgets/cart_data_page.dart';
import 'package:ezy_buy/features/cart_page/presentaion/views/widgets/empty_cart.dart';
import 'package:ezy_buy/features/home_page/presenation/view_model/product_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isLoading = false;
  final bool isCartEmpty = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.getCartItem.isEmpty
        ? const Scaffold(
            body: EmptyCartPage(),
          )
        : Scaffold(
            bottomNavigationBar: const BottomCartPage(),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: AppBar(
                  leading: Image.asset(AppImages.shoppingCart),
                  title: Text(
                    "cart(${cartProvider.getCartItem.length})",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        AppFunction.showWariningAlert(
                            context: context,
                            title: "Remove Items",
                            press: () async {
                              await cartProvider.clearCartFromFirebase();
                            });
                      },
                      icon: const Icon(
                        IconlyBold.delete,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
            body: const CartDataPage(),
          );
  }

  Future<void> placeOrder({
    required CartProvider cartProvider,
    required ProductProvider productProvider,
    required UserProvider userProvider,
  }) async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user == null) {
      return;
    }
    final uid = user.uid;
    try {
      setState(() {
        isLoading = true;
      });
      cartProvider.getCartItem.forEach((key, value) async {
        final getCurrProduct = productProvider.findById(value.productId!);
        final orderId = const Uuid().v4();
        await FirebaseFirestore.instance
            .collection("ordersAdanced")
            .doc(orderId)
            .set({
          'orderId': orderId,
          'userId': uid,
          'productId': value.productId,
          "productTitle": getCurrProduct!.productTitle,
          'price': double.parse(getCurrProduct.productPrice) * value.qty!,
          'totalPrice': cartProvider.getToTal(productProvider: productProvider),
          'quantity': value.qty,
          'imageUrl': getCurrProduct.productImage,
          'userName': userProvider.getUserModel!.userName,
          'orderDate': Timestamp.now(),
        });
      });
      await cartProvider.clearCartFromFirebase();
      cartProvider.clearCart();
    } catch (e) {
      AppFunction.showWariningAlert(
        context: context,
        title: e.toString(),
        press: () {},
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
