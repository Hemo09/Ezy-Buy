import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ezy_buy/features/search_page/presentaion/views/widgets/text_field_search.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 10,
        ),
        TextFieldSearch(),
        SizedBox(
          height: 20,
        ),
        Expanded(child: GridViewSearchItems()),
      ],
    );
  }
}

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

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(19.0),
              child: FancyShimmerImage(
                imageUrl: "https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png",
                height: size.height * .2,
                width: double.infinity,
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
                    "title" * 5,
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
                  child: const Text(
                    "16.5\$",
                    style: TextStyle(
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