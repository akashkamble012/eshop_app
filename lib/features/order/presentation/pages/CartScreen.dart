import 'package:eshop/core/Helper/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Helper/asset_path.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widget/custom_text_button.dart';
import '../../../auth/presentation/pages/signUpScreen.dart';
import '../bloc/shoping_cart/shopping_cart_bloc.dart';
import '../widgets/CartItemCard.dart';
import 'PlaceOrder.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
                builder: (context, state) {
                  if (state is ShoppingCartLoadedState) {
                    if (state.cartItems.isEmpty) {
                      return Center(
                        child: Image.asset(AssestPath.emptyCart),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.cartItems.length,
                      itemBuilder: (context, i) => CartItemCard(fruits: state.cartItems[i]),
                    );
                  }
                  return Center(
                    child: Image.asset(AssestPath.emptyCart),
                  );
                },
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Styles.sizedBoxH20,
                  BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
                    builder: (context, state) {
                      if (state is ShoppingCartLoadedState) {
                        return Text(
                          "Total ₹ ${state.total.toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        );
                      }
                      return const Text(
                        'Add Someting',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
                    builder: (context, state) {
                      if (state is ShoppingCartLoadedState) {
                        return CustomTextButton(
                          onPressed: state.cartItems.isNotEmpty
                              ? () {
                                  var auth = FirebaseAuth.instance;
                                  print('----- AUTH --${auth.currentUser}');
                                  // Navigator.of(context)
                                  //     .pushNamed(PlaceOrders.routeName);
                                  Navigator.of(context).pushNamed(
                                      auth.currentUser != null ? PlaceOrders.routeName : SignUp.routeName,
                                      arguments: {
                                        'drawer': false,
                                      });
                                }
                              : null,
                          backgroundColor: state.cartItems.isNotEmpty ? AppColor.secondaryColor : Colors.grey,
                          buttonName: 'Place Order',
                        );
                      }
                      return Styles.sizedBoxH20;
                    },
                  ),
                  Styles.sizedBoxW10,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*

  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
        ],
      ),
    );

 */
class Quantity extends StatefulWidget {
  const Quantity({Key? key}) : super(key: key);

  @override
  _QuantityState createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  int _quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (_quantity > 0) {
                _quantity--;
                setState(() {});
              }
            },
            splashRadius: 15.0,
            icon: Icon(
              Icons.remove,
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            alignment: Alignment.center,
            child: Text('$_quantity'),
          ),
          IconButton(
            onPressed: () {
              if (_quantity < 99) {
                _quantity++;
                setState(() {});
              }
            },
            splashRadius: 15.0,
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
    );
  }
}
