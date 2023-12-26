import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:ezy_buy/features/cart_page/presentaion/views/widgets/bottom_cart_page.dart';
import 'package:ezy_buy/features/cart_page/presentaion/views/widgets/cart_data_page.dart';
import 'package:ezy_buy/features/cart_page/presentaion/views/widgets/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  final bool isCartEmpty = false;

  @override
  Widget build(BuildContext context) {
    return isCartEmpty
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
                  title: const Text(
                    "cart(5)",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
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
}
