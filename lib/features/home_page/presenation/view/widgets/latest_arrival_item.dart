import 'package:ezy_buy/core/helper/favourite_icon.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class LatestArrival extends StatelessWidget {
  const LatestArrival({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: size.width * .53,
        height: size.height * .15,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: FancyShimmerImage(
                imageUrl: "https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png",
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
                      child: const Text(
                        "title",
                        maxLines: 2,
                        style: TextStyle(
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
                              child: Icon(Icons.add_shopping_cart_outlined),
                            )),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "1655 \$",
                    style: TextStyle(
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
    );
  }
}