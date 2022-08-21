import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../product/domain/entities/fruit.dart';
import '../place_order/cart_list.dart';

part 'shopping_cart_bloc.freezed.dart';
part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  final CartItemList _cartItemList;
  ShoppingCartBloc(this._cartItemList) : super(const ShoppingCartInitState()) {
    on<ShoppingCartAdd>(shoppingCartAdd);
    on<ShoppingCartRemove>(shoppingCartRemove);
    on<ShoppingCartRemoveAll>(shoppingCartRemoveAll);
  }

  void shoppingCartAdd(ShoppingCartAdd event, emit) {
    emit(const ShoppingCartLoadingState());
    _cartItemList.addCart(event.fruits);
    _shoppingCartItems();
  }

  void shoppingCartRemove(ShoppingCartRemove event, emit) {
    _cartItemList.remove(id: event.id);
    _shoppingCartItems();
  }

  void shoppingCartRemoveAll(ShoppingCartRemoveAll event, emit) {
    _cartItemList.removeAll();
    _shoppingCartItems();
  }

  void _shoppingCartItems() {
    emit(
      ShoppingCartLoadedState(
        cartItems: _cartItemList.orders,
        saveing: _cartItemList.saveing,
        total: _cartItemList.total,
        actuallPrice: _cartItemList.actuallPrice,
        offer: _cartItemList.offer,
      ),
    );
  }
}
