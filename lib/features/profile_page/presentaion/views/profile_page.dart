import 'package:ezy_buy/features/profile_page/presentaion/views/widgets/app_bar_profile.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/widgets/profile_page_body.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarProfile(),
      ),
      body: ProfilePageBody(),
    );
  }
}
