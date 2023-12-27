import 'package:flutter/material.dart';

class UserEmailAndImage extends StatelessWidget {
  const UserEmailAndImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.background,
                  width: 4,
                ),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                  ),
                )),
          ),
          const SizedBox(
            width: 6,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ahmed Mohamed",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "abeem69@gmail.com",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
