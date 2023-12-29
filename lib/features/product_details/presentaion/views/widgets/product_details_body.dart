import 'package:ezy_buy/features/product_details/presentaion/views/widgets/product_content.dart';
import 'package:ezy_buy/features/product_details/presentaion/views/widgets/product_image.dart';
import 'package:flutter/material.dart';

class ItemDetailsBody extends StatelessWidget {
  const ItemDetailsBody({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ProducTImage(
            productId: productId,
          ),
          ProductContent(productId: productId),
        ],
      ),
    );
  }
}
