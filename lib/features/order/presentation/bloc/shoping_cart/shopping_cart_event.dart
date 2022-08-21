part of 'shopping_cart_bloc.dart';

@freezed
class ShoppingCartEvent with _$ShoppingCartEvent {
  const factory ShoppingCartEvent.shoppingCartAdd({required Fruits fruits}) =
      ShoppingCartAdd;
  const factory ShoppingCartEvent.shoppingCartRemove({required String id}) =
      ShoppingCartRemove;
  const factory ShoppingCartEvent.shoppingCartRemoveAll() =
      ShoppingCartRemoveAll;
}
