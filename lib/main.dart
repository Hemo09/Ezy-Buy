import 'package:ezy_buy/core/theme/theme_data.dart';
import 'package:ezy_buy/core/theme/theme_provider.dart';
import 'package:ezy_buy/core/utils/app_router.dart';
import 'package:ezy_buy/features/auth_pages/presenation/view_model/user_provider.dart';
import 'package:ezy_buy/features/cart_page/presentaion/view_model/provider/cart_provider.dart';
import 'package:ezy_buy/features/home_page/presenation/view_model/product_provider.dart';
import 'package:ezy_buy/features/profile_page/presentaion/view_model/order_provider/order_provider.dart';
import 'package:ezy_buy/features/profile_page/presentaion/view_model/viewed_recently_provider/viewed_recently_provider.dart';
import 'package:ezy_buy/features/profile_page/presentaion/view_model/wish_list_provider/wish_list_provider.dart';
import 'package:ezy_buy/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: SelectableText(
                    "An error has been occured ${snapshot.error}"),
              ),
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) {
                return ThemeProvider();
              }),
              ChangeNotifierProvider(create: (context) {
                return ProductProvider();
              }),
              ChangeNotifierProvider(create: (context) {
                return CartProvider();
              }),
              ChangeNotifierProvider(create: (context) {
                return WishlistProvider();
              }),
              ChangeNotifierProvider(create: (context) {
                return ViewedRecentlyProvider();
              }),
              ChangeNotifierProvider(create: (context) {
                return UserProvider();
              }),
              ChangeNotifierProvider(create: (context) {
                return OrdersProvider();
              }),
            ],
            child: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return MaterialApp.router(
                  routerConfig: AppRoutes.routes,
                  debugShowCheckedModeBanner: false,
                  theme: Style.themeData(
                      isDarkTheme: themeProvider.isDarkMode, context: context),
                );
              },
            ),
          );
        });
  }
}
