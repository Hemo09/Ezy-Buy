import 'package:flutter/material.dart';

class VisibiltyText extends StatelessWidget {
  const VisibiltyText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Visibility(
      visible: false,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          "Please login to have ultimate access",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
