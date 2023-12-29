import 'package:ezy_buy/features/home_page/presenation/view_model/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final getFindById = productProvider.findById(productId);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  getFindById!.productTitle,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "${getFindById.productPrice}\$",
                style: const TextStyle(
                  fontSize: 19,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Material(
                color: Colors.lightGreen,
                elevation: 0.0,
                shape: CircleBorder(),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(IconlyLight.heart),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: SizedBox(
                  height: kBottomNavigationBarHeight - 10,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_shopping_cart_outlined,
                        size: 27,
                      ),
                      label: const Text(
                        "add to cart",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w700),
                      )),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "About this item",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
              Text(
                "In ${getFindById.productCategory}",
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            getFindById.productDescription,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
