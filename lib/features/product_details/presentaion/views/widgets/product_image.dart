import 'package:ezy_buy/features/home_page/presenation/view_model/product_provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProducTImage extends StatelessWidget {
  const ProducTImage({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final getFindById = productProvider.findById(productId);
    Size size = MediaQuery.of(context).size;

    return FancyShimmerImage(
      imageUrl: getFindById!.productImage,
      boxFit: BoxFit.cover,
      height: size.height * .4,
      width: double.infinity,
    );
  }
}
