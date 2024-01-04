import 'package:ezy_buy/core/helper/function/app_fucntion.dart';
import 'package:ezy_buy/features/profile_page/presentaion/view_model/wish_list_provider/wish_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class FavouriteIcon extends StatefulWidget {
  const FavouriteIcon(
      {super.key,
      this.size = 22,
      this.color = Colors.transparent,
      required this.productId});
  final double size;
  final Color? color;
  final String productId;

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final wishListProvider = Provider.of<WishlistProvider>(context);
    return Material(
      color: widget.color,
      elevation: 0.0,
      shape: const CircleBorder(),
      child: IconButton(
          onPressed: () async {
            // wishlistProvider.addOrRemoveFromWishlist(productId: widget.productId);
            // log("wishlist Map is: ${wishlistProvider.getWishlistItems} ");
            setState(() {
              isLoading = true;
            });
            try {
              if (wishListProvider.getWishlistItems
                  .containsKey(widget.productId)) {
                wishListProvider.removeWishlistItemFromFirebase(
                  wishlistId:
                      wishListProvider.getWishlistItems[widget.productId]!.id!,
                  productId: widget.productId,
                );
              } else {
                wishListProvider.addToWishlistFirebase(
                    productId: widget.productId, context: context);
              }
              await wishListProvider.fetchWishlist();
            } catch (e) {
              AppFunction.showWariningAlert(
                context: context,
                title: e.toString(),
                press: () {},
              );
            } finally {
              setState(() {
                isLoading = false;
              });
            }
          },
          icon: isLoading
              ? const CircularProgressIndicator()
              : Icon(
                  wishListProvider.isProductInWishlist(
                          productId: widget.productId)
                      ? IconlyBold.heart
                      : IconlyLight.heart,
                  color: Colors.red,
                  size: widget.size,
                )),
    );
  }
}
