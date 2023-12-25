import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:ezy_buy/core/utils/widgets/custom_empty_cart.dart';
import 'package:flutter/material.dart';

class CartPageBody extends StatelessWidget {
  const CartPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          EmptyCart(
            body:
                "Looks like you didn't add anything yet to your cart \n go ahead and start shopping now",
            buttonText: "shop Now",
            pathImage: AppImages.shoppingBasket,
            subtitle: "Your cart is Empty",
            title: "Whoops!!",
          ),
        ],
      ),
    );
  }
}
