import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/shoping_cart/shopping_cart_bloc.dart';
import 'OrdersCard.dart';

class PlaceOrderList extends StatelessWidget {
  const PlaceOrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
      builder: (context, state) {
        if (state is ShoppingCartLoadedState) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, i) => OrdersCard(fruits: state.cartItems[i]),
                childCount: state.cartItems.length),
          );
        }
        return const SliverToBoxAdapter(
          child: Center(
            child: SizedBox(),
          ),
        );
      },
    );
  }
}
