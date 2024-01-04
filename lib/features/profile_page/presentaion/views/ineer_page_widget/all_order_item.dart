import 'package:ezy_buy/features/profile_page/data/models/order_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class AllOrderItem extends StatefulWidget {
  const AllOrderItem({super.key, required this.ordersModelAdvanced});
  final OrdersModelAdvanced ordersModelAdvanced;

  @override
  State<AllOrderItem> createState() => _AllOrderItemState();
}

class _AllOrderItemState extends State<AllOrderItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(19.0),
            child: FancyShimmerImage(
              imageUrl: widget.ordersModelAdvanced.imageUrl,
              height: size.height * .15,
              width: size.width * .3,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * .33,
                      child: Text(
                        widget.ordersModelAdvanced.productTitle,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.red,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${widget.ordersModelAdvanced.price}\$",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Qty: ${widget.ordersModelAdvanced.quantity} ",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
