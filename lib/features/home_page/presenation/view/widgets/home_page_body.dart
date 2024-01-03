import 'package:ezy_buy/features/home_page/presenation/view/widgets/card_swiper.dart';
import 'package:ezy_buy/features/home_page/presenation/view/widgets/grid_categoey.dart';
import 'package:ezy_buy/features/home_page/presenation/view/widgets/latest_arrival_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/models/product_model.dart';
import '../../view_model/product_provider.dart';

class HomepageBody extends StatelessWidget {
  const HomepageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CardSwiperItems(),
            const SizedBox(
              height: 15,
            ),
            Visibility(
              visible: productProvider.getProduct.isNotEmpty,
              child: const Text(
                "Lates Arrival",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
              ),
            ),
            const LatestArrivalList(),
            const Text(
              "Categories",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            const GridCategories(),
          ],
        ),
      ),
    );
  }
}
