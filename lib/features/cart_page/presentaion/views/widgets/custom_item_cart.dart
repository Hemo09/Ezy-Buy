import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CustomItemCart extends StatelessWidget {
  const CustomItemCart({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(19.0),
            child: FancyShimmerImage(
              imageUrl: "https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png",
              height: size.height * .15,
              width: size.width * .25,
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * .5,
                    child: const Text(
                      "titlevvvvvvtitletitletitlevvvtitletitletitletitletitletitletitletitlevtitlevvvvvvvtitletitle",
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.red,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            IconlyLight.heart,
                            color: Colors.red,
                          )),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "16.5\$",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: Colors.red),
                  ),
                  OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(IconlyLight.arrowDown2),
                      label: const Text(
                        "Qty:6",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
