import 'package:ezy_buy/core/helper/favourite_icon.dart';
import 'package:ezy_buy/core/helper/function/app_fucntion.dart';
import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:ezy_buy/core/utils/app_router.dart';
import 'package:ezy_buy/features/cart_page/presentaion/view_model/provider/cart_provider.dart';
import 'package:ezy_buy/features/home_page/presenation/view_model/product_provider.dart';
import 'package:ezy_buy/features/profile_page/presentaion/view_model/viewed_recently_provider/viewed_recently_provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final viewedRecntly = Provider.of<ViewedRecentlyProvider>(context);
    final getFindById = productProvider.findById(productId);
    Size size = MediaQuery.of(context).size;
    return getFindById == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    viewedRecntly.addOrRemove(productId: getFindById.productId);
                    await GoRouter.of(context).push(
                        NamedRouteScreen.kItemDetails,
                        extra: getFindById.productId);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(19.0),
                    child: FancyShimmerImage(
                      imageUrl: getFindById.productImage,
                      height: size.height * .2,
                      width: double.infinity,
                      errorWidget: Image.asset(AppImages.noImage),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: size.width * .9,
                        child: Text(
                          getFindById.productTitle,
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    FavouriteIcon(productId: getFindById.productId)
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: size.width * .2,
                        child: Text(
                          "${getFindById.productPrice}\$",
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Colors.red),
                        ),
                      ),
                    ),
                    Flexible(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Material(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: IconButton(
                              onPressed: () async {
                                if (cartProvider.isProductInCart(
                                    producId: getFindById.productId)) {
                                  return;
                                }
                                try {
                                  await cartProvider.addToCartFirebase(
                                      productId: getFindById.productId,
                                      qty: 1,
                                      context: context);
                                } catch (error) {
                                  AppFunction.showWariningAlert(
                                      context: context,
                                      title: error.toString(),
                                      press: () {});
                                }
                              },
                              icon: Icon(cartProvider.isProductInCart(
                                      producId: getFindById.productId)
                                  ? Icons.check
                                  : Icons.add_shopping_cart_outlined),
                              color: Colors.green,
                            ),
                          )),
                    )),
                  ],
                )
              ],
            ),
          );
  }
}
