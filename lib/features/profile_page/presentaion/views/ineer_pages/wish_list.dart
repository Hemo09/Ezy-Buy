import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ezy_buy/features/search_page/presentaion/views/widgets/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            leading: IconButton(
              icon: const Icon(
                IconlyBold.arrowLeft2,
                size: 24,
              ),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            title: const Text(
              "Wish List (1)",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  IconlyBold.delete,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
            ],
          )),
      body: Column(
        children: [
          Expanded(
            child: DynamicHeightGridView(
                physics: const BouncingScrollPhysics(),
                builder: (context, index) {
                  return const Center(child: GridViewItem());
                },
                itemCount: 15,
                crossAxisCount: 2),
          ),
        ],
      ),
    );
  }
}
