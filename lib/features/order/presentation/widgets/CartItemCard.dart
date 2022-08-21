import 'package:eshop/core/Helper/styles.dart';
import 'package:eshop/core/theme/app_color.dart';
import 'package:eshop/features/order/presentation/bloc/shoping_cart/shopping_cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/popMessage/dialog/alert_dialog_box.dart';
import '../../../../core/widget/custom_text_button.dart';
import '../../../product/domain/entities/fruit.dart';

class CartItemCard extends StatelessWidget {
  final Fruits fruits;
  const CartItemCard({Key? key, required this.fruits}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey("${fruits.id}"),
      direction: DismissDirection.endToStart,
      movementDuration: const Duration(milliseconds: 200),
      background: Container(
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete, size: 40),
      ),
      confirmDismiss: (DismissDirection dismissDirection) async {
        if (DismissDirection.endToStart == dismissDirection) {
          return AlertDialogBoxs.deleteProduct(context, okButton: () {
            BlocProvider.of<ShoppingCartBloc>(context).add(ShoppingCartRemove(id: fruits.id!));
            Navigator.of(context).pop(true);
          });
        }
      },
      child: SizedBox(
        width: double.infinity,
        height: 150,
        child: Card(
          elevation: 2,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: Styles.edgeInsetsAll10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${fruits.name}',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Styles.sizedBoxH08,
                      Row(
                        children: [
                          Text(
                            '₹${fruits.offPrice?.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Styles.sizedBoxW08,
                          Text(
                            '₹ ${fruits.price}',
                            // '₹1000',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Styles.sizedBoxW08,
                          Text(
                            '${fruits.offer?.toInt()} off',
                            // ' off',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Save ${fruits.save?.toStringAsFixed(2)}',
                        // 'Save 35}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextButton(
                              onPressed: () {},
                              buttonName: 'ADD MORE',
                            ),
                          ),
                          Expanded(
                            child: CustomTextButton(
                              onPressed: () async {
                                await AlertDialogBoxs.deleteProduct(context, okButton: () {
                                  BlocProvider.of<ShoppingCartBloc>(context).add(ShoppingCartRemove(id: fruits.id!));
                                  Navigator.of(context).pop(true);
                                });
                              },
                              textColor: AppColor.secondaryColor,
                              backgroundColor: AppColor.white,
                              buttonName: 'REMOVE',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Image.network(fruits.imageUrl!, fit: BoxFit.cover),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
