import 'package:ezy_buy/core/utils/constants.dart';
import 'package:ezy_buy/features/home_page/presenation/view/widgets/category_item.dart';
import 'package:flutter/material.dart';

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
