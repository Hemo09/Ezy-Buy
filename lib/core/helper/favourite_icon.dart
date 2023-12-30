import 'package:ezy_buy/features/home_page/presenation/view_model/product_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    final wishListProvider = Provider.of<WishListProvider>(context);
    return Material(
      color: widget.color,
      elevation: 0.0,
      shape: const CircleBorder(),
      child: IconButton(
          onPressed: () {
            wishListProvider.addOrRemove(productId: widget.productId);
          },
          icon: Icon(
            wishListProvider.isProductInCart(producId: widget.productId)
                ? IconlyBold.heart
                : IconlyLight.heart,
            color: Colors.red,
            size: widget.size,
          )),
    );
  }
}
