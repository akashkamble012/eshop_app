import 'package:eshop/features/order/presentation/bloc/shoping_cart/shopping_cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widget/custom_text_button.dart';
import '../../../order/presentation/bloc/place_order/place_order_bloc.dart';
import '../../domain/entities/fruit.dart';
import '../pages/ProductView.dart';

class FruitsCard extends StatelessWidget {
  final Fruits fruits;

  const FruitsCard({Key? key, required this.fruits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const sizedBoxh4 = SizedBox(height: 4);
    return InkWell(
      splashColor: AppColor.primaryColor,
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductView.routeName,
          arguments: fruits,
        );
      },
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: double.infinity,
                height: 190,
                child: Image.network(
                  fruits.imageUrl!,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  '${fruits.name}',
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    sizedBoxh4,
                    Text(
                      fruits.unit!,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    sizedBoxh4,
                    //  price! - (price * offer! / 100)
                    Row(
                      children: [
                        Text(
                          'Rs.${(fruits.price! - (fruits.price! * fruits.offer! / 100)).floorToDouble()}',
                        ),
                        const Spacer(),
                        Text(
                          'MRP:Rs ${fruits.price}',
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    sizedBoxh4,
                  ],
                ),
              ),
              CustomTextButton(
                buttonName: 'ADD TO CART',
                onPressed: () {
                  BlocProvider.of<ShoppingCartBloc>(context).add(ShoppingCartAdd(fruits: fruits));
                },
              ),
            ],
          ),
        ),
      ),
    );

/*

 IconButton(
                        onPressed: () {
                          orderController.addCart(fruits);
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Theme.of(context).iconTheme.color,
                          size: Theme.of(context)
                              .iconTheme
                              .copyWith(size: 35)
                              .size,
                        ),
                      ),


 */
    // InkWell(
    // splashColor: Colors.red,
    // onTap: () {
    //   Navigator.of(context).pushNamed(
    //     ProductView.routeName,
    //     arguments: fruits,
    //   );
    // },
    //   child: Container(
    //     decoration: BoxDecoration(
    //       border: Border.all(
    //         color: Colors.grey,
    //       ),
    //     ),
    //     child: GridTile(
    //       child: Hero(
    //         tag: fruits.id.toString(),
    //         child: Image.network(
    //           fruits.imageUrl!,
    //         ),
    //       ),
    //     footer: Container(
    //       padding: EdgeInsets.all(4),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           const SizedBox(height: 4),
    //           Text(
    //             fruits.name!,
    //             style: Theme.of(context).textTheme.headline6,
    //           ),
    //           const SizedBox(height: 4),
    //           Text(
    //             fruits.unit!,
    //             style: Theme.of(context).textTheme.subtitle1,
    //           ),
    //           Row(
    //             children: [
    //               Text(
    //                 'Rs.${(fruits.offPrice)!.floorToDouble()}',
    //               ),
    //               SizedBox(width: 4),
    //               Text(
    //                 'MRP:Rs ${fruits.price}',
    //                 style: TextStyle(
    //                   decoration: TextDecoration.lineThrough,
    //                 ),
    //               ),
    //               Spacer(),
    //               IconButton(
    //                 onPressed: () {
    //                   orderController.addCart(fruits);
    //                 },
    //                 icon: Icon(
    //                   Icons.shopping_cart,
    //                   color: Theme.of(context).iconTheme.color,
    //                   size:
    //                       Theme.of(context).iconTheme.copyWith(size: 35).size,
    //                 ),
    //               )
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
    // );
  }
}
