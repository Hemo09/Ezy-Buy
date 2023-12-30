import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:ezy_buy/core/utils/widgets/custom_empty_cart.dart';
import 'package:flutter/material.dart';

class EmptyCartPage extends StatelessWidget {
  const EmptyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomNoData(
            body:
                "Looks like you didn't add anything yet to your cart \n go ahead and start shopping now",
            pathImage: AppImages.shoppingBasket,
            subtitle: "Your cart is Empty",
            title: "Whoops!!",
          ),
        ],
      ),
    );
  }
}
