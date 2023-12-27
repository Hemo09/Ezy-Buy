import 'package:ezy_buy/core/utils/widgets/app_name_shimmer.dart';
import 'package:ezy_buy/features/product_details/presentaion/views/widgets/item_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                IconlyBold.arrowLeft2,
                size: 24,
              ),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            title: const CustomAppNamedShimmer(),
          )),
      body: const ItemDetailsBody(),
    );
  }
}
