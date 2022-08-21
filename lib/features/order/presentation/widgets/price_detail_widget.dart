import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/shoping_cart/shopping_cart_bloc.dart';

class PriceDetailsWidget extends StatelessWidget {
  const PriceDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
      builder: (context, state) {
        if (state is ShoppingCartLoadedState) {
          return SliverToBoxAdapter(
            child: Card(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Price Details',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const Divider(thickness: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Price (Items ${state.cartItems.length})',
                              style:const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text('₹${state.actuallPrice}'),
                          ],
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           const Text(
                              'Discount',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              (state.actuallPrice - state.total).toStringAsFixed(2),
                              // 'SANTOS',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           const Text(
                              'Delivery Charges',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text('₹${state.total > 500 ? 50 : 0}')
                            // Text('₹${350 > 500 ? 50 : 0}')
                          ],
                        ),
                      ),
                      const Divider(thickness: 2),
                      Padding(
                        padding:const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           const Text(
                              'Total Amount',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                                '₹${state.total > 500 ? state.total.floorToDouble() + 50 : state.total.floorToDouble()}'),
                          ],
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.symmetric(vertical: 6.0),
                        // state.saveing ${().floorToDouble()}
                        child: Text(
                          'You will save ₹${state.saveing.toStringAsFixed(2)} on this order',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
