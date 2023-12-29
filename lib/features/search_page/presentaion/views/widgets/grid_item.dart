import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:ezy_buy/core/utils/app_router.dart';
import 'package:ezy_buy/features/home_page/data/models/product_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, this.model});
  final ProductModel? model;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              GoRouter.of(context).push(NamedRouteScreen.kItemDetails);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(19.0),
              child: FancyShimmerImage(
                imageUrl: model!.productImage,
                height: size.height * .2,
                width: double.infinity,
                errorWidget: Image.asset(AppImages.noImage),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: SizedBox(
                  width: size.width * .9,
                  child: Text(
                    model!.productTitle,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const Icon(IconlyLight.heart),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: SizedBox(
                  width: size.width * .2,
                  child: Text(
                    "${model!.productPrice}\$",
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: Colors.red),
                  ),
                ),
              ),
              Flexible(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: const Material(
                    color: Color.fromARGB(255, 152, 154, 167),
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Icon(Icons.add_shopping_cart_outlined),
                    )),
              )),
            ],
          )
        ],
      ),
    );
  }
}
