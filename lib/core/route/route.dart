import 'package:flutter/material.dart';

import '../../features/account/presentation/pages/Account.dart';
import '../../features/auth/presentation/pages/signInScreen.dart';
import '../../features/auth/presentation/pages/signUpScreen.dart';
import '../../features/order/presentation/pages/CartScreen.dart';
import '../../features/order/presentation/pages/OrderScreen.dart';
import '../../features/order/presentation/pages/PlaceOrder.dart';
import '../../features/product/presentation/pages/ProductView.dart';
import '../../features/product/presentation/pages/Product_home_screen.dart';
import '../Helper/CustomRoute.dart';

class AppRoute {
  static Map<String, Widget Function(BuildContext)> nameRoute = {
    ProductHomeScreen.routeName: (_) => const ProductHomeScreen(),
    PlaceOrders.routeName: (_) => const PlaceOrders(),
    CartScreen.routeName: (_) => const CartScreen(),

    // '/': (_) => const ProductList(),
    SignIn.routeName: (_) => const SignIn(),
    SignUp.routeName: (_) => const SignUp(),
    ProductView.routeName: (_) => const ProductView(),
    // AnimationPractice.routeName: (_) => const AnimationPractice(),
    Account.routeName: (_) => const Account(),
    OrderScreen.routeName: (_) => const OrderScreen(),
    // IDemo.routeName: (_) => IDemo(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ProductView.routeName:
        return RouteSlideTransitionAnimation(
          widget: const ProductView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            backgroundColor: Colors.red,
            body: Center(
              child: Text(
                "Page Not Found",
              ),
            ),
          ),
        );
    }
  }
}
