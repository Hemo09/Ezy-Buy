import 'package:ezy_buy/features/home_page/presenation/view/widgets/latest_arrival_item.dart';
import 'package:flutter/material.dart';

class LatestArrivalList extends StatelessWidget {
  const LatestArrivalList({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .2,
      width: size.width * 3,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const LatestArrival();
        },
        itemCount: 13,
      ),
    );
  }
}
