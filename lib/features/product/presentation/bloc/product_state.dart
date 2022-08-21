part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.loadedProduct({required List<Fruits> fruits}) = LoadedProduct;
  const factory ProductState.loadingProduct() = LoadingProduct;
  const factory ProductState.error({required String message}) = Error;

}
