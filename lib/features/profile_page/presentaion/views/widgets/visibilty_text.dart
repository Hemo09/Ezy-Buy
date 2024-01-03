import 'package:ezy_buy/features/auth_pages/presenation/view/inner_screen/loading_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VisibiltyText extends StatelessWidget {
  const VisibiltyText({super.key, required this.isLoading, required this.user});
  final bool isLoading;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return LoadingManager(
      isLoading: isLoading,
      child: Visibility(
        visible: user == null ? true : false,
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            "Please login to have ultimate access",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
