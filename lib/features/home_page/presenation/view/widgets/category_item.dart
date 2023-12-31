import 'package:ezy_buy/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.image, required this.name});
  final String image, name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(NamedRouteScreen.kSearchPage, extra: name);
      },
      child: Column(
        children: [
          Image.asset(
            image,
            height: 50,
            width: 50,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            name,
            maxLines: 1,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
