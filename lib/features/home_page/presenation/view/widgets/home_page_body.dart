import 'package:ezy_buy/features/home_page/presenation/view/widgets/card_swiper.dart';
import 'package:ezy_buy/features/home_page/presenation/view/widgets/grid_categoey.dart';
import 'package:ezy_buy/features/home_page/presenation/view/widgets/latest_arrival_list.dart';
import 'package:flutter/material.dart';

class HomepageBody extends StatelessWidget {
  const HomepageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardSwiperItems(),
            SizedBox(
              height: 15,
            ),
            Text(
              "Lates Arrival",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
            ),
            LatestArrivalList(),
            Text(
              "Categories",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            GridCategories(),
          ],
        ),
      ),
    );
  }
}
