import 'package:card_swiper/card_swiper.dart';
import 'package:ezy_buy/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CardSwiperItems extends StatelessWidget {
  const CardSwiperItems({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * .25,
      child: Swiper(
        itemCount: AppConstants.banners.length,
        itemBuilder: (context, index) {
          return Image.asset(
            AppConstants.banners[index],
            fit: BoxFit.fill,
          );
        },
        duration: 1,
        autoplay: true,
        pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
              color: Colors.white,
              activeColor: Colors.red,
            )),
      ),
    );
  }
}
