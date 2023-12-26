import 'package:ezy_buy/features/profile_page/presentaion/views/widgets/profile_content.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/widgets/profile_fotter.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/widgets/user_email_photo_profile.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/widgets/visibilty_text.dart';
import 'package:flutter/material.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            VisibiltyText(),
            UserEmailAndImage(),
            SizedBox(
              height: 10,
            ),
            ProfileContent(),
            SizedBox(
              height: 7,
            ),
            ProfileFooter(),
          ],
        ),
      ),
    );
  }
}
