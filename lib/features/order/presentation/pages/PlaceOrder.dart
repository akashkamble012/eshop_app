import 'package:eshop/core/Helper/styles.dart';
import 'package:eshop/core/popMessage/dialog/alert_dialog_box.dart';
import 'package:eshop/features/order/presentation/bloc/place_order/place_order_bloc.dart';
import 'package:eshop/features/product/presentation/pages/Product_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widget/custom_text_button.dart';
import '../../domain/entities/Orders.dart';
import '../bloc/shoping_cart/shopping_cart_bloc.dart';
import '../widgets/place_order_list.dart';
import '../widgets/price_detail_widget.dart';

class PlaceOrders extends StatelessWidget {
  static const routeName = '/PlaceOrders';
  const PlaceOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Order'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            PlaceOrderList(),
            PriceDetailsWidget(),
          ],
        ),
      ),
      bottomNavigationBar: const __BottomNavigation(),
    );
  }
}

class __BottomNavigation extends StatelessWidget {
  const __BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      child: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
        builder: (context, state) {
          if (state is ShoppingCartLoadedState) {
            return Row(
              children: [
                const SizedBox(width: 20),
                Text(
                  'Amount ₹ ${state.total > 500 ? state.total.floorToDouble() + 50 : state.total.floorToDouble()}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                BlocListener<PlaceOrderBloc, PlaceOrderState>(
                  listener: (context, state) {
                    if (state is PlaceOrderLoadingState) {
                      AlertDialogBoxs.showLoader(context);
                    }
                    if (state is PlaceOrderSuccessState || state is PlaceOrderLoadedState) {
                      AlertDialogBoxs.popLoader();
                    }
                    if (state is PlaceOrderSuccessState) {
                      Navigator.of(context).popUntil(ModalRoute.withName(ProductHomeScreen.routeName));
                      BlocProvider.of<ShoppingCartBloc>(context).add(const ShoppingCartRemoveAll());
                    }
                  },
                  child: CustomTextButton(
                    onPressed: () async {
                      // AlertDialogBoxs.showLoader(context);
                      // Future.delayed(Duration(seconds: 1)).then((value) {
                      //   AlertDialogBoxs.popLoader();
                      // });
                      BlocProvider.of<PlaceOrderBloc>(context).add(
                        PlaceOrderPutEvent(
                          orders: Orders(
                            orderId: DateTime.now().toIso8601String(),
                            items: state.cartItems,
                            totalPrice:
                                state.total > 500 ? state.total.floorToDouble() + 50 : state.total.floorToDouble(),
                            discount: (state.actuallPrice - state.total).floorToDouble(),
                            itemPerPrice: state.actuallPrice,
                            save: state.saveing,
                          ),
                          userId: '',
                        ),
                      );
                    },
                    buttonName: 'CONTINUE',
                  ),
                ),
                Styles.sizedBoxW10,
              ],
            );
          }

          return Styles.sizedBoxW10;
        },
      ),
    );
  }
}

/*
Empty Order 

  Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('have a great day :)'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .popUntil(ModalRoute.withName('/'));
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).accentColor,
                                    ),
                                  ),
                                  child: Text(
                                    'HOME',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                      OrderScreen.routeName,
                                      ModalRoute.withName('/'),
                                    );
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).accentColor,
                                    ),
                                  ),
                                  child: Text(
                                    'ORDERS',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                  
                  

 */

/*


Price (Items)
Discount
 Delivery Charges 


 address Field




No Remove Button 



 */
