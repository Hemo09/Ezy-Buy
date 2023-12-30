import 'package:ezy_buy/features/cart_page/presentaion/views/widgets/custom_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/provider/cart_provider.dart';

class CartDataPage extends StatelessWidget {
  const CartDataPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: cartProvider.getCartItem.values
                .toList()
                .reversed
                .toList()[index],
            child: const CustomItemCart(),
          );
        },
        itemCount: cartProvider.getCartItem.length,
      ),
    );
  }
}
