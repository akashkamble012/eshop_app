import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import 'banner_fruit_card.dart';

class ProductBannerWidget extends StatelessWidget {
  const ProductBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is LoadedProduct) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 250,
              child: PageView.builder(
                itemBuilder: (_, i) => BannerFruitsCard(
                  fruits: state.fruits[i],
                ),
                itemCount: state.fruits.length,
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
