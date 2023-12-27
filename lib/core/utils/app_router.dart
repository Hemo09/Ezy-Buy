import 'package:ezy_buy/features/cart_page/presentaion/views/cart_page.dart';
import 'package:ezy_buy/features/home_page/presenation/view/home_page.dart';
import 'package:ezy_buy/features/product_details/presentaion/views/item_details.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/ineer_pages/viewed_recently.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/profile_page.dart';
import 'package:ezy_buy/features/profile_page/presentaion/views/ineer_pages/wish_list.dart';
import 'package:ezy_buy/features/root_page/root_page.dart';
import 'package:ezy_buy/features/search_page/presentaion/views/search_page.dart';
import 'package:go_router/go_router.dart';

class NamedRouteScreen {
  static const kRootPage = "/";
  static const kHomeView = "/homePage";
  static const kProfilePage = "/profilePage";
  static const kSearchPage = "/searchPage";
  static const kcartPage = "/cartPage";
  static const kItemDetails = "/ItemDetails";
  static const kWishList = "/kWishList";
  static const kViewedRecently = "/kViewedRecently";
}

class AppRoutes {
  static final routes = GoRouter(routes: [
    GoRoute(
      path: NamedRouteScreen.kRootPage,
      builder: (context, state) => const RootPage(),
    ),
    GoRoute(
      path: NamedRouteScreen.kHomeView,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: NamedRouteScreen.kProfilePage,
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: NamedRouteScreen.kSearchPage,
      builder: (context, state) => const SearchPage(),
    ),
    GoRoute(
      path: NamedRouteScreen.kcartPage,
      builder: (context, state) => const CartPage(),
    ),
    GoRoute(
      path: NamedRouteScreen.kItemDetails,
      builder: (context, state) => const ItemDetails(),
    ),
    GoRoute(
      path: NamedRouteScreen.kWishList,
      builder: (context, state) => const WishList(),
    ),
    GoRoute(
      path: NamedRouteScreen.kViewedRecently,
      builder: (context, state) => const ViewedRecently(),
    ),
  ]);
}
