import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';
import '../../domain/entities/fruit.dart';
import '../pages/ProductView.dart';

class BannerFruitsCard extends StatelessWidget {
  final Fruits fruits;

  const BannerFruitsCard({Key? key, required this.fruits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColor.primaryColor,
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductView.routeName, arguments: fruits);
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
            ],
          ),
        ),
      ),
    );
  }
}
