import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ezy_buy/features/home_page/data/models/product_model.dart';
import 'package:ezy_buy/features/home_page/presenation/view_model/product_provider.dart';
import 'package:ezy_buy/features/search_page/presentaion/views/widgets/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridViewSearchItems extends StatelessWidget {
  const GridViewSearchItems({super.key, this.category});
  final String? category;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final List<ProductModel> products = category == null
        ? productProvider.getProduct
        : productProvider.findByCategory(category!);
    return DynamicHeightGridView(
        physics: const BouncingScrollPhysics(),
        builder: (context, index) {
          return Center(
              child: ChangeNotifierProvider.value(
            value: products[index],
            child: GridViewItem(productId: products[index].productId),
          ));
        },
        itemCount: products.length,
        crossAxisCount: 2);
  }
}
