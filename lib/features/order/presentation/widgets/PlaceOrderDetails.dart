import 'package:eshop/core/Helper/styles.dart';
import 'package:eshop/features/product/domain/entities/fruit.dart';
import 'package:flutter/material.dart';

class PlaceOrdersCardDetails extends StatelessWidget {
  final List<Fruits> items;
  final double discount;
  final double totalAmount;
  const PlaceOrdersCardDetails({
    Key? key,
    required this.discount,
    required this.totalAmount,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Orders Details',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey.shade500,
              ),
            ),
            // const Divider(thickness: 2),
            Column(
              children: [
                ExpansionTile(
                  onExpansionChanged: (value) async {},
                  tilePadding: Styles.edgeInsetsSymHor00,
                  iconColor: Colors.green,
                  textColor: Theme.of(context).primaryColor,
                  title: Text(
                    'Price (Items ${items.length})',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  childrenPadding: Styles.edgeInsetsSymHor00,
                  children: List.generate(
                    items.length,
                    (index) => Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${items[index].name}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '₹${items[index].price}',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: Styles.edgeInsetsSymVer06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Discount',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '₹ $discount',
                  ),
                ],
              ),
            ),
            Padding(
              padding: Styles.edgeInsetsSymVer06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Delivery Charges',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text('₹50'),
                ],
              ),
            ),
            const Divider(thickness: 2),

            Padding(
              padding: Styles.edgeInsetsSymVer06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Amount',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text('₹ $totalAmount'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
