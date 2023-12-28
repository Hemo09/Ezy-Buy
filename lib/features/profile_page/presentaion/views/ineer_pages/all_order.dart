import 'package:ezy_buy/features/cart_page/presentaion/views/widgets/empty_cart.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/profile_Page_widgets/all_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';

class AllOrderProfile extends StatelessWidget {
  const AllOrderProfile({super.key});
  final bool isEmptyOrder = false;

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
                "All Order (1)",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
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
        body: isEmptyOrder
            ? const EmptyCartPage()
            : ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return const AllOrderItem();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: 10));
  }
}
