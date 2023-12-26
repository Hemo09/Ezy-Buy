import 'package:ezy_buy/features/home_page/presenation/view/widgets/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

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
        ],
      ),
    );
  }
}

class LatestArrival extends StatelessWidget {
  const LatestArrival({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3,
      child: Flexible(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: FancyShimmerImage(
                imageUrl: "https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png",
                width: size.width * 0.28,
                height: size.width * 0.28,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Column(
                children: [
                  Flexible(
                    child: SizedBox(
                      width: size.width * .9,
                      child: Text(
                        "title",
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Icon(IconlyLight.heart),
                  Icon(Icons.add_shopping_cart_outlined),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
