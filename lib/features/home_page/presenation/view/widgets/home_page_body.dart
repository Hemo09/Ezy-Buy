import 'package:ezy_buy/features/home_page/presenation/view/widgets/card_swiper.dart';
import 'package:ezy_buy/features/home_page/presenation/view/widgets/latest_arrival_list.dart';
import 'package:flutter/material.dart';

class HomepageBody extends StatelessWidget {
  const HomepageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CardSwiperItems(),
          SizedBox(
            height: 15,
          ),
          LatestArrivalList(),
        ],
      ),
    );
  }
}
