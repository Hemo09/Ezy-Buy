import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ezy_buy/constants.dart';
import 'package:ezy_buy/features/search_page/presentaion/views/widgets/grid_item.dart';
import 'package:flutter/material.dart';

class GridViewSearchItems extends StatelessWidget {
  const GridViewSearchItems({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(
        physics: const BouncingScrollPhysics(),
        builder: (context, index) {
          return Center(
              child: GridViewItem(
            model: AppConstants.localProds[index],
          ));
        },
        itemCount: AppConstants.localProds.length,
        crossAxisCount: 2);
  }
}
