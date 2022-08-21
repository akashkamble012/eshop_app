import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/Utility/NotificationBadge.dart';
import '../../../../core/theme/app_color.dart';
import '../../../order/presentation/bloc/shoping_cart/shopping_cart_bloc.dart';
import '../../../order/presentation/pages/CartScreen.dart';
import '../widgets/Drawer.dart';
import '../widgets/product.dart_widget.dart';
import '../widgets/product_banner_widget.dart';

class ProductHomeScreen extends StatelessWidget {
  static const routeName = '/ProdutHomeScreen';
  const ProductHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruits'),
        backgroundColor: AppColor.primaryColor,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () async {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          );
        }),
        actions: [
          NotificationBadge(
            icon: Icons.notifications,
            onPressed: () {
              // BlocProvider.of<ProductBloc>(context).add(const GetProduct());
              // Navigator.of(context).pushNamed(IDemo.routeName);
            },
          ),
          BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
            builder: (context, state) {
              if (state is ShoppingCartLoadedState) {
                return NotificationBadge(
                  icon: Icons.shopping_cart,
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  number: state.cartItems.length,
                );
              }
              return NotificationBadge(
                icon: Icons.shopping_cart,
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              );
            },
          ),
        ],
      ),
      drawer: Drawers(),
      body: const CustomScrollView(
        slivers: [
          ProductBannerWidget(),
          ProductWidget(),
        ],
      ),
    );
  }
}
