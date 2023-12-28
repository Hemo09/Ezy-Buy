import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SignInGooglButton extends StatelessWidget {
  const SignInGooglButton({super.key, this.press});
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 219, 217, 217),
            padding: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          onPressed: press,
          icon: const Icon(
            Ionicons.logo_google,
            color: Colors.red,
          ),
          label: const Text(
            "Sign In With Google",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
          )),
    );
  }
}
