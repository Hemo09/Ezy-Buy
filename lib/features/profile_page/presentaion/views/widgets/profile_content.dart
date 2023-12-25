import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Genral",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 7,
          ),
          CustomListTile(
            pathImage: AppImages.orderSvg,
            text: "All orders",
            press: () {},
          ),
          CustomListTile(
            pathImage: AppImages.wishlistSvg,
            text: "Wishlist",
            press: () {},
          ),
          CustomListTile(
            pathImage: AppImages.recent,
            text: "Viewed recently",
            press: () {},
          ),
          CustomListTile(
            pathImage: AppImages.address,
            text: "Address",
            press: () {},
          ),
        ],
      ),
    );
  }
}
