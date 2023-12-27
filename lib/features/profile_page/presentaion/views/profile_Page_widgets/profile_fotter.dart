import 'package:ezy_buy/core/theme/theme_provider.dart';
import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/profile_Page_widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

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
                      label: const Text("Login")))),
        ],
      ),
    );
  }
}
