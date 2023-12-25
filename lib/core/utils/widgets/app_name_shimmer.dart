import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomAppNamedShimmer extends StatelessWidget {
  const CustomAppNamedShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.black,
        child: const Text(
          "EzyBuy",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}
