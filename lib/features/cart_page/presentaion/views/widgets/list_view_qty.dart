import 'package:ezy_buy/features/cart_page/data/models/cart_model.dart';
import 'package:ezy_buy/features/cart_page/presentaion/view_model/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.cartModel});
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Column(
      children: [
        Container(
          height: 6,
          width: 50,
          color: Colors.grey,
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  cartProvider.updateQuantity(
                      productId: cartModel.productId!, quantity: index);
                  GoRouter.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    "$index",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  )),
                ),
              );
            },
            itemCount: 30,
          ),
        ),
      ],
    );
  }
}
