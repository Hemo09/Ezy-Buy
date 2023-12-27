import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppFunction {
  static Future<void> showWariningAlert({
    required BuildContext context,
    required String title,
    bool isError = false,
    required Function()? press,
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImages.warning,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !isError,
                      child: TextButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.red),
                          )),
                    ),
                    TextButton(
                        onPressed: press,
                        child: const Text(
                          "ok",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.green),
                        ))
                  ],
                ),
              ],
            ),
          );
        });
  }
}
