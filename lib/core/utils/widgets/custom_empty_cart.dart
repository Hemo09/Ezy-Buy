import 'package:ezy_buy/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNoData extends StatelessWidget {
  const CustomNoData({
    super.key,
    required this.pathImage,
    required this.title,
    required this.subtitle,
    required this.body,
  });
  final String pathImage, title, subtitle, body;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                pathImage,
                height: size.height * .3,
                width: double.infinity,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                body,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 100,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15.0),
                      elevation: 0.0,
                    ),
                    onPressed: () {
                      GoRouter.of(context).push(NamedRouteScreen.kRootPage);
                    },
                    child: const Text(
                      "Shop Now",
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
