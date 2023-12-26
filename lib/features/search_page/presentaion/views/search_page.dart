import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:ezy_buy/features/search_page/presentaion/views/widgets/search_page_body.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: Image.asset(AppImages.shoppingCart),
          title: const Text(
            "Store Products",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: const SearchPageBody(),
    );
  }
}
