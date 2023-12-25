import 'dart:math';

import 'package:ezy_buy/core/theme/theme_provider.dart';
import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/widgets/custom_list_tile.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/widgets/profile_content.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/widgets/user_email_photo_profile.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/widgets/visibilty_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
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
    );
  }
}

class ProfileFooter extends StatelessWidget {
  const ProfileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProv = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            thickness: 2,
          ),
          const Text(
            "Setting",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: Image.asset(
                AppImages.theme,
                height: 30,
              ),
              title: Text(themeProv.isDarkMode() ? "Dark mode" : "light mode"),
              value: themeProv.isDarkMode(),
              onChanged: (value) {
                themeProv.setThemeMode(themeValue: value);
              }),
          const Divider(
            thickness: 2,
          ),
          const Text(
            "Other",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w500,
            ),
          ),
          CustomListTile(
              text: "Privacy & policy",
              pathImage: AppImages.privacy,
              press: () {}),
          Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {},
                      icon: const Icon(IconlyLight.login),
                      label: const Text("Login"))))
        ],
      ),
    );
  }
}
