import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ezy_buy/constants.dart';
import 'package:ezy_buy/features/home_page/presenation/view_model/product_provider.dart';
import 'package:ezy_buy/features/search_page/presentaion/views/widgets/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridViewSearchItems extends StatelessWidget {
  const GridViewSearchItems({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return DynamicHeightGridView(
        physics: const BouncingScrollPhysics(),
        builder: (context, index) {
          return Center(
              child: ChangeNotifierProvider.value(
            value: productProvider.getProduct[index],
            child: GridViewItem(
                productId: productProvider.getProduct[index].productId),
          ));
        },
        itemCount: productProvider.getProduct.length,
        crossAxisCount: 2);
  }
}
