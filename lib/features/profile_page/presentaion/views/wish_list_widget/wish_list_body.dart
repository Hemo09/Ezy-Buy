import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ezy_buy/features/search_page/presentaion/views/widgets/grid_item.dart';
import 'package:flutter/material.dart';

class WishListBody extends StatelessWidget {
  const WishListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: DynamicHeightGridView(
              physics: const BouncingScrollPhysics(),
              builder: (context, index) {
                return const Center(child: GridViewItem());
              },
              itemCount: 15,
              crossAxisCount: 2),
        ),
      ],
    );
  }
}
