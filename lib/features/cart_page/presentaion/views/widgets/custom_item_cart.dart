import 'dart:developer';

import 'package:ezy_buy/core/helper/favourite_icon.dart';
import 'package:ezy_buy/features/cart_page/data/models/cart_model.dart';
import 'package:ezy_buy/features/cart_page/presentaion/view_model/provider/cart_provider.dart';
import 'package:ezy_buy/features/cart_page/presentaion/views/widgets/list_view_qty.dart';
import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../../../../home_page/presenation/view_model/product_provider.dart';

class CustomItemCart extends StatelessWidget {
  const CustomItemCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartModelProvider = Provider.of<CartModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final getFindById = productProvider.findById(cartModelProvider.productId!);
    final cartProvider = Provider.of<CartProvider>(context);
    Size size = MediaQuery.of(context).size;
    return getFindById == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(19.0),
                  child: FancyShimmerImage(
                    imageUrl: getFindById.productImage,
                    height: size.height * .15,
                    width: size.width * .3,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * .33,
                            child: Text(
                              getFindById.productTitle,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    try {
                                      await cartProvider
                                          .removeCartItemFromFirebase(
                                        cartId: cartModelProvider.cartId!,
                                        productId: getFindById.productId,
                                        qty: cartModelProvider.qty!,
                                      );
                                    } catch (error) {
                                      log(error.toString());
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.clear,
                                    color: Colors.red,
                                  )),
                              FavouriteIcon(productId: getFindById.productId),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${getFindById.productPrice}\$",
                            style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                          ),
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              side: const BorderSide(
                                width: 2,
                                color: Colors.blue,
                              ),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: (context),
                                builder: (context) {
                                  return CustomListView(
                                    cartModel: cartModelProvider,
                                  );
                                },
                              );
                            },
                            icon: const Icon(IconlyLight.arrowDown2),
                            label: Text("Qty:${cartModelProvider.qty} "),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: kBottomNavigationBarHeight + 10,
                ),
              ],
            ),
          );
  }
}
