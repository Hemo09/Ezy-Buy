import 'package:ezy_buy/core/helper/favourite_icon.dart';
import 'package:ezy_buy/core/utils/app_router.dart';
import 'package:ezy_buy/features/home_page/data/models/product_model.dart';
import 'package:ezy_buy/features/profile_page/presentaion/view_model/viewed_recently_provider/viewed_recently_provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../cart_page/presentaion/view_model/provider/cart_provider.dart';

class LatestArrival extends StatelessWidget {
  const LatestArrival({super.key, required this.model, this.productId});
  final ProductModel model;
  final String? productId;

  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context);

    final viewedRecntly = Provider.of<ViewedRecentlyProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          viewedRecntly.addOrRemove(productId: productModel.productId);
          GoRouter.of(context).push(NamedRouteScreen.kItemDetails,
              extra: productModel.productId);
        },
        child: SizedBox(
          width: size.width * .53,
          height: size.height * .15,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: FancyShimmerImage(
                  imageUrl: model.productImage,
                  width: size.width * 0.28,
                  height: size.width * 0.28,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: size.width * .9,
                        child: Text(
                          model.productTitle,
                          maxLines: 2,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          FavouriteIcon(productId: productModel.productId),
                          IconButton(
                            onPressed: () {
                              if (cartProvider.isProductInCart(
                                  producId: productModel.productId)) {
                                return;
                              }
                              cartProvider.addCartItem(
                                  productId: productModel.productId);
                            },
                            icon: Icon(
                              cartProvider.isProductInCart(
                                      producId: productModel.productId)
                                  ? Icons.check
                                  : Icons.add_shopping_cart_rounded,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${productModel.productPrice} \$",
                      style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: Colors.red),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
