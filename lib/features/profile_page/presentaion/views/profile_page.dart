import 'dart:isolate';

import 'package:ezy_buy/core/helper/function/app_fucntion.dart';
import 'package:ezy_buy/core/utils/constants.dart';
import 'package:ezy_buy/features/auth_pages/data/models/user_model.dart';
import 'package:ezy_buy/features/auth_pages/presenation/view_model/user_provider.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/widgets/app_bar_profile.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/widgets/profile_page_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user = AppFirebase.fireAuth.currentUser;
  bool _isLoading = true;
  UserModel? userModel;

  Future<void> fetchUserInfo() async {
    if (user == null) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      userModel = await userProvider.fetchUserInfo();
    } catch (error) {
      await AppFunction.showWariningAlert(
        context: context,
        title: "An error has been occured $error",
        press: () {},
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    fetchUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarProfile(),
      ),
      body: ProfilePageBody(
        isLoading: _isLoading,
        user: user,
        userModel: userModel,
      ),
    );
  }
}
