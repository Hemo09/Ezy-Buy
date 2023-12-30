import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:ezy_buy/features/cart_page/data/models/cart_model.dart';
import 'package:ezy_buy/features/cart_page/presentaion/view_model/provider/cart_provider.dart';
import 'package:ezy_buy/features/cart_page/presentaion/views/widgets/bottom_cart_page.dart';
import 'package:ezy_buy/features/cart_page/presentaion/views/widgets/cart_data_page.dart';
import 'package:ezy_buy/features/cart_page/presentaion/views/widgets/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, this.cartModel});
  final bool isCartEmpty = false;
  final CartModel? cartModel;

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
