import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/fruit.dart';
import '../../domain/usecases/get_all_product.dart';

part 'product_bloc.freezed.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProduct _getAllProduct;

  ProductBloc(this._getAllProduct) : super(const LoadingProduct()) {
    on<GetProduct>(productEventInit);
  }
  // final StreamSubscription _bannerStrea;
  void productEventInit(GetProduct event, emit) async {
    emit(const LoadingProduct());
    final getallProduct = await _getAllProduct();
    // final getBannerProduct = await _getBannerProduct();
    getallProduct.fold((failure) {
      emit(Error(message: failure.message));
    }, (success) {
      emit(LoadedProduct(fruits: success));
    });
  }
}
