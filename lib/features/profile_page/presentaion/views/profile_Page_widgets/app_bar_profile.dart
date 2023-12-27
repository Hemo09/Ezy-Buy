import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:ezy_buy/core/utils/widgets/app_name_shimmer.dart';
import 'package:flutter/material.dart';

class AppBarProfile extends StatelessWidget {
  const AppBarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AppBar(
        leading: Image.asset(AppImages.shoppingCart),
        title: const CustomAppNamedShimmer(),
      ),
    );
  }
}
