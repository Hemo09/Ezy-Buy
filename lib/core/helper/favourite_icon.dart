import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon(
      {super.key, this.size = 22, this.color = Colors.transparent, this.press});
  final double size;
  final Color? color;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: 0.0,
      shape: const CircleBorder(),
      child: IconButton(
          onPressed: press,
          icon: Icon(
            IconlyLight.heart,
            size: size,
          )),
    );
  }
}
