import 'package:ezy_buy/features/product_details/presentaion/views/widgets/product_content.dart';
import 'package:ezy_buy/features/product_details/presentaion/views/widgets/product_image.dart';
import 'package:flutter/material.dart';

class ItemDetailsBody extends StatelessWidget {
  const ItemDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          ProducTImage(),
          ProductContent(),
        ],
      ),
    );
  }
}
