import 'package:ezy_buy/features/auth_pages/data/models/user_model.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/ineer_page_widget/profile_fotter.dart';

import 'package:ezy_buy/features/profile_page/presentaion/views/widgets/profile_content.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/widgets/user_email_photo_profile.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/widgets/visibilty_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePageBody extends StatefulWidget {
  const ProfilePageBody(
      {super.key, required this.isLoading, this.user, this.userModel});
  final bool isLoading;
  final User? user;
  final UserModel? userModel;

  @override
  State<ProfilePageBody> createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePageBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            VisibiltyText(
              isLoading: widget.isLoading,
              user: widget.user,
            ),
            const UserEmailAndImage(),
            const SizedBox(
              height: 10,
            ),
            ProfileContent(
              user: widget.user,
            ),
            const SizedBox(
              height: 7,
            ),
            const ProfileFooter(),
          ],
        ),
      ),
    );
  }
}
