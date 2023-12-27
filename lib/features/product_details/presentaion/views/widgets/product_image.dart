import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ProducTImage extends StatelessWidget {
  const ProducTImage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FancyShimmerImage(
      imageUrl: "https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png",
      boxFit: BoxFit.cover,
      height: size.height * .4,
      width: double.infinity,
    );
  }
}
