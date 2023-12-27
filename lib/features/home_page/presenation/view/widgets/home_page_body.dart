import 'package:ezy_buy/constants.dart';
import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:ezy_buy/features/home_page/presenation/view/widgets/card_swiper.dart';
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
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
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

class GridCategories extends StatelessWidget {
  const GridCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      children: List.generate(AppConstants.categoriesNamed.length, (index) {
        return CategoryItem(
            image: AppConstants.categoriesNamed[index].image,
            name: AppConstants.categoriesNamed[index].name);
      }),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.image, required this.name});
  final String image, name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 50,
          width: 50,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          name,
          maxLines: 1,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
