import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 6,
          width: 50,
          color: Colors.grey,
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "$index",
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                )),
              );
            },
            itemCount: 30,
          ),
        ),
      ],
    );
  }
}
