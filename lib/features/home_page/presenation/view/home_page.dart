import 'package:ezy_buy/features/home_page/presenation/view/widgets/home_page_body.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/profile_Page_widgets/app_bar_profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarProfile(),
      ),
      body: HomepageBody(),
    );
  }
}
