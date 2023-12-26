import 'package:ezy_buy/features/cart_page/presentaion/views/cart_page.dart';
import 'package:ezy_buy/features/home_page/presenation/view/home_page.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/profile_page.dart';
import 'package:ezy_buy/features/search_page/presentaion/views/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late PageController pagecontroller;
  int currentPage = 0;
  List<Widget> pages = const [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
  ];
  @override
  void initState() {
    pagecontroller = PageController(initialPage: currentPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pagecontroller,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: currentPage,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 13,
          onDestinationSelected: (index) {
            setState(() {
              currentPage = index;
            });
            pagecontroller.jumpToPage(currentPage);
          },
          destinations: const [
            NavigationDestination(
                selectedIcon: Icon(IconlyBold.home),
                icon: Icon(IconlyLight.home),
                label: "Home"),
            NavigationDestination(
                selectedIcon: Icon(IconlyBold.search),
                icon: Icon(IconlyLight.search),
                label: "Search"),
            NavigationDestination(
                selectedIcon: Icon(IconlyBold.bag2),
                icon: Badge(label: Text('6'), child: Icon(IconlyLight.bag2)),
                label: "Cart"),
            NavigationDestination(
                selectedIcon: Icon(IconlyBold.profile),
                icon: Icon(IconlyLight.profile),
                label: "Profile"),
          ]),
    );
  }
}
