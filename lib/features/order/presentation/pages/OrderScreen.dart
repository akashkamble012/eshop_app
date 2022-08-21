import 'package:eshop/features/order/presentation/bloc/place_order/place_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/popMessage/circular_loader.dart';
import '../../../../core/theme/app_color.dart';
import '../widgets/PlaceOrderDetails.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/OrderScreen';
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      BlocProvider.of<PlaceOrderBloc>(context).add(const PlaceOrderGetEvent(userId: ''));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: BlocBuilder<PlaceOrderBloc, PlaceOrderState>(
              builder: (context, state) {
                if (state is PlaceOrderLoadingState) {
                  return const CircularLoader();
                }
                if (state is PlaceOrderLoadedState) {
                  return ListView.separated(
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, i) => PlaceOrdersCardDetails(
                      discount: state.cartItems[i].discount,
                      totalAmount: state.cartItems[i].totalPrice,
                      items: state.cartItems[i].items,
                    ),
                    separatorBuilder: (_, i) => const SizedBox(
                      height: 10.0,
                    ),
                  );
                }
                return const Center(
                  child: Text(' No Order'),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
