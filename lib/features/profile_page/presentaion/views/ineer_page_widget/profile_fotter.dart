import 'package:ezy_buy/core/theme/theme_provider.dart';
import 'package:ezy_buy/core/utils/app_images.dart';
import 'package:ezy_buy/core/utils/app_router.dart';
import 'package:ezy_buy/core/utils/constants.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/widgets/custom_list_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileFooter extends StatefulWidget {
  const ProfileFooter({super.key});

  @override
  State<ProfileFooter> createState() => _ProfileFooterState();
}

class _ProfileFooterState extends State<ProfileFooter> {
  User? user = FirebaseAuth.instance.currentUser;
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
              title: Text(themeProv.isDarkMode ? "Dark mode" : "light mode"),
              value: themeProv.isDarkMode,
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
                onPressed: () async {
                  if (user == null) {
                    GoRouter.of(context).push(NamedRouteScreen.kLogin);
                  } else {
                    await AppFirebase.fireAuth.signOut();
                    if (!mounted) return;
                    GoRouter.of(context).push(NamedRouteScreen.kRootPage);
                  }
                },
                icon: Icon(user == null ? Icons.login : Icons.logout_outlined),
                label: Text(user == null ? "Login" : "LogOut"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
