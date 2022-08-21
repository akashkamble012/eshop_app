import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/widget/custom_text_button.dart';
import '../../../order/presentation/bloc/shoping_cart/shopping_cart_bloc.dart';
import '../../../order/presentation/pages/CartScreen.dart';
import '../../domain/entities/fruit.dart';

class ProductView extends StatelessWidget {
  static const routeName = '/ProductView';
  const ProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const sizedBoxW8 = SizedBox(width: 8);
    final data = ModalRoute.of(context)!.settings.arguments as Fruits;
    const sizedBoxh8 = SizedBox(height: 8);
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name ?? ''),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height * 0.45,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Hero(
                              tag: data.id.toString(),
                              child: Image.network(
                                data.imageUrl!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    sizedBoxh8,
                    const Divider(),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.name!,
                            style: const TextStyle(fontSize: 18),
                          ),
                          sizedBoxh8,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'MRP:Rs ${data.price}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey.shade600,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              sizedBoxW8,
                              Text(
                                'Price : Rs.${(data.price! - (data.price! * data.offer! / 100)).floorToDouble()}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              sizedBoxW8,
                              Text(
                                'You Save:${(data.price! * data.offer! / 100).floorToDouble()}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          sizedBoxh8,
                          const Divider(),
                          Row(
                            children: [
                              const Icon(
                                Icons.delivery_dining_sharp,
                                color: Colors.grey,
                                size: 30,
                              ),
                              sizedBoxW8,
                              Text(
                                'Standard: Today 9:00AM - 11:00AM',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    sizedBoxh8,
                    _ProductDescription(
                      title: 'About the Product',
                      listOfDescription: data.aboutTheProduct!,
                    ),
                    sizedBoxh8,
                    _ProductDescription(
                      title: 'Benefits',
                      listOfDescription: data.benefits!,
                    ),
                    sizedBoxh8,
                    _ProductDescription(
                      title: 'Storage and Uses',
                      listOfDescription: data.storageAndUses!,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextButton(
                  onPressed: () {
                    BlocProvider.of<ShoppingCartBloc>(context).add(ShoppingCartAdd(fruits: data));
                  },
                  size: const Size(0.0, 50),
                  buttonName: 'ADD TO CART',
                ),
              ),
              Expanded(
                child: CustomTextButton(
                  onPressed: () async {
                    BlocProvider.of<ShoppingCartBloc>(context).add(ShoppingCartAdd(fruits: data));
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  size: const Size(0.0, 50),
                  backgroundColor: AppColor.white,
                  textColor: AppColor.secondaryColor,
                  buttonName: 'BUY NOW',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProductDescription extends StatelessWidget {
  final String title;
  final List<String> listOfDescription;
  const _ProductDescription({Key? key, required this.title, required this.listOfDescription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.all(8.0),
      tilePadding: const EdgeInsets.symmetric(horizontal: 6),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      textColor: Colors.black54,
      iconColor: Colors.black54,
      collapsedTextColor: Colors.black,
      children: List.generate(
        listOfDescription.length,
        (i) => Text(
          listOfDescription[i],
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
