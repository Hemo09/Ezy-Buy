import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ezy_buy/features/profile_page/presentaion/view_model/viewed_recently_provider/viewed_recently_provider.dart';
import 'package:ezy_buy/features/search_page/presentaion/views/widgets/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ViewedRecently extends StatelessWidget {
  const ViewedRecently({super.key});

  @override
  Widget build(BuildContext context) {
    final viewedRecently = Provider.of<ViewedRecentlyProvider>(context);
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
              "Viewed Recently (${viewedRecently.getViewedRecntlyListItem.length})",
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
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
                  return Center(
                      child: GridViewItem(
                    productId: viewedRecently.getViewedRecntlyListItem.values
                        .toList()[index]
                        .productId!,
                  ));
                },
                itemCount: viewedRecently.getViewedRecntlyListItem.length,
                crossAxisCount: 2),
          ),
        ],
      ),
    );
  }
}
