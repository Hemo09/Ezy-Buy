import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ezy_buy/features/search_page/presentaion/views/widgets/grid_item.dart';
import 'package:flutter/material.dart';

class GridViewSearchItems extends StatelessWidget {
  const GridViewSearchItems({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(
        physics: const BouncingScrollPhysics(),
        builder: (context, index) {
          return const Center(child: GridViewItem());
        },
        itemCount: 20,
        crossAxisCount: 2);
  }
}
