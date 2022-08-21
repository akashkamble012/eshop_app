part of 'shopping_cart_bloc.dart';

@freezed
class ShoppingCartState with _$ShoppingCartState {
  const factory ShoppingCartState.initial() = ShoppingCartInitState;
  const factory ShoppingCartState.loading() = ShoppingCartLoadingState;
  const factory ShoppingCartState.loaded({required List<Fruits> cartItems, required double actuallPrice, required double total , required double saveing , required double offer}) = ShoppingCartLoadedState;
  const factory ShoppingCartState.error({required String message}) = ShoppingCartErrorState;
}
 