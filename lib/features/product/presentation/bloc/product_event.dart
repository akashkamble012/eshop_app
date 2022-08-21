part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.getProduct() = GetProduct;
  const factory ProductEvent.init() = Init;
}
