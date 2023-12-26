import 'package:ezy_buy/features/cart_page/presentaion/views/widgets/custom_item_cart.dart';
import 'package:flutter/material.dart';

class CartDataPage extends StatelessWidget {
  const CartDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const CustomItemCart();
        },
        itemCount: 15,
      ),
    );
  }
}
