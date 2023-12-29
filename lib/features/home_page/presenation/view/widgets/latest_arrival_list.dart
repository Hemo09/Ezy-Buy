import 'package:ezy_buy/features/home_page/data/models/product_model.dart';
import 'package:ezy_buy/features/home_page/presenation/view/widgets/latest_arrival_item.dart';
import 'package:ezy_buy/features/home_page/presenation/view_model/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LatestArrivalList extends StatelessWidget {
  const LatestArrivalList({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final List<ProductModel> products = productProvider.getProduct;
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .2,
      width: size.width * 3,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return LatestArrival(
            model: products[index],
          );
        },
        itemCount: products.length,
      ),
    );
  }
}
