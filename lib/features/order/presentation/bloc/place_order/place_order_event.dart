part of 'place_order_bloc.dart';

@freezed
class PlaceOrderEvent with _$PlaceOrderEvent {
  const factory PlaceOrderEvent.putOrder({required Orders orders,required String userId}) = PlaceOrderPutEvent;
  const factory PlaceOrderEvent.getOrder({required String userId}) = PlaceOrderGetEvent;
  // const factory PlaceOrderEvent.getCartItems() = GetCartItems;
  // const factory PlaceOrderEvent.addToCart({required Fruits fruits}) = AddToCart;
  // const factory PlaceOrderEvent.removeFromCart({required String? id}) = RemoveFromCart;
  // const factory PlaceOrderEvent.emptyCart() = EmptyCart;
}