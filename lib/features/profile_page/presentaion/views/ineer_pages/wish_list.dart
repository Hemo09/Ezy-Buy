import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ezy_buy/core/helper/function/app_fucntion.dart';
import 'package:ezy_buy/features/profile_page/presentaion/view_model/wish_list_provider/wish_list_provider.dart';
import 'package:ezy_buy/features/search_page/presentaion/views/widgets/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    final wishListProvider = Provider.of<WishListProvider>(context);
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
            title: Text(
              "Wish List (${wishListProvider.getWishListItem.length})",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  IconlyBold.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  AppFunction.showWariningAlert(
                      context: context,
                      title: "Remove Items",
                      press: () {
                        wishListProvider.clearCart();
                        GoRouter.of(context).pop();
                      });
                },
              ),
            ],
          )),
      body: Column(
        children: [
          Expanded(
            child: DynamicHeightGridView(
                physics: const BouncingScrollPhysics(),
                builder: (context, index) {
                  return Center(
                      child: GridViewItem(
                    productId: wishListProvider.getWishListItem.values
                        .toList()[index]
                        .productId!,
                  ));
                },
                itemCount: wishListProvider.getWishListItem.length,
                crossAxisCount: 2),
          ),
        ],
      ),
    );
  }
}
