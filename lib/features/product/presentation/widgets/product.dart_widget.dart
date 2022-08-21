import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/product_bloc.dart';
import 'FruitsCard.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        print('^^^^^^  $state');
        if (state is LoadedProduct) {
          if (state.fruits.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'No Product',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            );
          }
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (_, i) {
                return FruitsCard(fruits: state.fruits[i]);
              },
              childCount: state.fruits.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2 / 4,
              crossAxisCount: 2,
            ),
          );
        }
        return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
