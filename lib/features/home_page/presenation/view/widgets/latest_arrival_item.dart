import 'package:ezy_buy/core/helper/favourite_icon.dart';
import 'package:ezy_buy/core/utils/app_router.dart';
import 'package:ezy_buy/features/home_page/data/models/product_model.dart';
import 'package:ezy_buy/features/home_page/presenation/view_model/product_provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LatestArrival extends StatelessWidget {
  const LatestArrival({super.key, required this.model, this.productId});
  final ProductModel model;
  final String? productId;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    final getFindById = productProvider.findById(productId!);

    Size size = MediaQuery.of(context).size;
    return getFindById == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                GoRouter.of(context).push(NamedRouteScreen.kItemDetails,
                    extra: getFindById.productId);
              },
              child: SizedBox(
                width: size.width * .53,
                height: size.height * .15,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: FancyShimmerImage(
                        imageUrl: model.productImage,
                        width: size.width * 0.28,
                        height: size.width * 0.28,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: SizedBox(
                              width: size.width * .9,
                              child: Text(
                                model.productTitle,
                                maxLines: 2,
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const FavouriteIcon(),
                              const SizedBox(
                                width: 9,
                              ),
                              Flexible(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: const Material(
                                    color: Color.fromARGB(255, 152, 154, 167),
                                    child: Padding(
                                      padding: EdgeInsets.all(1.5),
                                      child: Icon(
                                          Icons.add_shopping_cart_outlined),
                                    )),
                              )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${model.productPrice} \$",
                            style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w700,
                                color: Colors.red),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
