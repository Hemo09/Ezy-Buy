import 'package:ezy_buy/features/cart_page/presentaion/views/widgets/empty_cart.dart';
import 'package:ezy_buy/features/profile_page/data/models/order_model.dart';
import 'package:ezy_buy/features/profile_page/presentaion/view_model/order_provider/order_provider.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/ineer_page_widget/all_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AllOrderProfile extends StatelessWidget {
  const AllOrderProfile({super.key});
  final bool isEmptyOrder = false;

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context);

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
      body: FutureBuilder<List<OrdersModelAdvanced>>(
        future: ordersProvider.fetchOrder(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child:
                  SelectableText("An error has been occured ${snapshot.error}"),
            );
          } else if (!snapshot.hasData || ordersProvider.getOrders.isEmpty) {
            return const EmptyCartPage();
          }
          return ListView.separated(
            itemCount: snapshot.data!.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                child: AllOrderItem(
                    ordersModelAdvanced: ordersProvider.getOrders[index]),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
          );
        }),
      ),
    );
  }
}
