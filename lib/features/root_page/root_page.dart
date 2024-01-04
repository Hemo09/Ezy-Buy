import 'dart:developer';

import 'package:ezy_buy/features/cart_page/presentaion/view_model/provider/cart_provider.dart';
import 'package:ezy_buy/features/cart_page/presentaion/views/cart_page.dart';
import 'package:ezy_buy/features/home_page/presenation/view/home_page.dart';
import 'package:ezy_buy/features/profile_page/presentaion/view_model/wish_list_provider/wish_list_provider.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/profile_page.dart';
import 'package:ezy_buy/features/search_page/presentaion/views/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../auth_pages/presenation/view_model/user_provider.dart';
import '../home_page/presenation/view_model/product_provider.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late PageController pagecontroller;
  bool isLoadingProds = true;

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

  Future<void> fetchData() async {
    final productsProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final wishlistProvider =
        Provider.of<WishlistProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      Future.wait({
        productsProvider.fetchProducts(),
        userProvider.fetchUserInfo(),
      });
      Future.wait({
        cartProvider.fetchCart(),
        wishlistProvider.fetchWishlist(),
      });
    } catch (error) {
      log(error.toString());
    } finally {
      setState(() {
        isLoadingProds = false;
      });
    }
  }

  @override
  void didChangeDependencies() {
    if (isLoadingProds) {
      fetchData();
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
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
          destinations: [
            const NavigationDestination(
                selectedIcon: Icon(IconlyBold.home),
                icon: Icon(IconlyLight.home),
                label: "Home"),
            const NavigationDestination(
                selectedIcon: Icon(IconlyBold.search),
                icon: Icon(IconlyLight.search),
                label: "Search"),
            NavigationDestination(
                selectedIcon: const Icon(IconlyBold.bag2),
                icon: Badge(
                    label: Text("${cartProvider.getCartItem.length}"),
                    child: const Icon(IconlyLight.bag2)),
                label: "Cart"),
            const NavigationDestination(
                selectedIcon: Icon(IconlyBold.profile),
                icon: Icon(IconlyLight.profile),
                label: "Profile"),
          ]),
    );
  }
}
