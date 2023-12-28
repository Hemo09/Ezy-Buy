import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class AllOrderItem extends StatelessWidget {
  const AllOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(19.0),
            child: FancyShimmerImage(
              imageUrl: "https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png",
              height: size.height * .15,
              width: size.width * .3,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * .33,
                      child: const Text(
                        "titlevvvvvvtitletitletitlevvvtitletitletitletitletitletitletitletitlevtitlevvvvvvvtitletitle",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.red,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "price :16.5\$",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Qty: 6 ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
