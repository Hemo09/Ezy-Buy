import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductContent extends StatelessWidget {
  const ProductContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  "Product Moq to the Air Force Forces",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "162.2\$",
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Material(
                color: Colors.lightGreen,
                elevation: 0.0,
                shape: CircleBorder(),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(IconlyLight.heart),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                child: SizedBox(
                  height: kBottomNavigationBarHeight - 10,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_shopping_cart_outlined,
                        size: 27,
                      ),
                      label: const Text(
                        "add to cart",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w700),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
